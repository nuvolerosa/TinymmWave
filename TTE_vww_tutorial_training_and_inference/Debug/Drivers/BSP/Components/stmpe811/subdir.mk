################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/stmpe811/stmpe811.c 

C_DEPS += \
./Drivers/BSP/Components/stmpe811/stmpe811.d 

OBJS += \
./Drivers/BSP/Components/stmpe811/stmpe811.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/stmpe811/stmpe811.o: ../Drivers/BSP/Components/stmpe811/stmpe811.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=c11 -g -DSTM32F746xx -c -I../Src -I"/home/nicole/STM32CubeIDE/M1/TTE_vww_tutorial_training_and_inference/Src/TinyEngine/include" -I"/home/nicole/STM32CubeIDE/M1/TTE_vww_tutorial_training_and_inference/Src/TinyEngine/include/arm_cmsis" -I"/home/nicole/STM32CubeIDE/M1/TTE_vww_tutorial_training_and_inference/Src/TinyEngine/codegen/Include" -I../Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/BSP/STM32746G-Discovery -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../TinyEngine/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Components/stmpe811/stmpe811.d" -MT"$@"  -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

