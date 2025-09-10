import serial
import time
import threading
import glob

# --------------------------------
# Auto-detect first STM32 ACM port
# --------------------------------
ports = glob.glob("/dev/stm32f7-discovery")
if not ports:
    raise Exception("No STM32 serial device found (/dev/stm32f7-discovery)")
port = ports[0]
print(f"Using serial port: {port}")

# Open serial port
ser = serial.Serial(port, 115200, timeout=1)
time.sleep(2)  # allow board to reset

# --------------------------------
# Set mode
# --------------------------------
mode = 0
running = True
ack = None

def user_input_thread():
    global mode, running
    while running:
        cmd = input("Enter 't' for training, 'i' for inference, 'q' to quit: ").lower()
        if cmd in ['t', 'i']:
            mode = cmd
            print(f"Switched mode to {'Training' if mode=='t' else 'Inference'}")
        elif cmd == 'q':
            running = False
            break

# Start the input thread
threading.Thread(target=user_input_thread, daemon=True).start()

# --------------------------------
# Main loop: send char continuously until ACK
# --------------------------------
try:
    while running:
        if mode != 0:
            char_to_send = b'3' if mode == 't' else b'4'
            ser.write(char_to_send)
            ack = ser.read(3)
            if ack == b'ACK':
                print(f"Received character: {char_to_send}")
                ack = None
                mode = 0
            time.sleep(0.01)  # avoid busy loop

except KeyboardInterrupt:
    print("\nStopped by user.")

finally:
    running = False
    ser.close()
    print("Serial port closed.")






