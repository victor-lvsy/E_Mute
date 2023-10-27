################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/bsp/disco_base.c \
../Core/Src/bsp/disco_i2c.c \
../Core/Src/bsp/disco_lcd.c \
../Core/Src/bsp/disco_qspi.c \
../Core/Src/bsp/disco_sai.c \
../Core/Src/bsp/disco_sdram.c \
../Core/Src/bsp/disco_ts.c \
../Core/Src/bsp/mpu.c \
../Core/Src/bsp/wm8994.c 

OBJS += \
./Core/Src/bsp/disco_base.o \
./Core/Src/bsp/disco_i2c.o \
./Core/Src/bsp/disco_lcd.o \
./Core/Src/bsp/disco_qspi.o \
./Core/Src/bsp/disco_sai.o \
./Core/Src/bsp/disco_sdram.o \
./Core/Src/bsp/disco_ts.o \
./Core/Src/bsp/mpu.o \
./Core/Src/bsp/wm8994.o 

C_DEPS += \
./Core/Src/bsp/disco_base.d \
./Core/Src/bsp/disco_i2c.d \
./Core/Src/bsp/disco_lcd.d \
./Core/Src/bsp/disco_qspi.d \
./Core/Src/bsp/disco_sai.d \
./Core/Src/bsp/disco_sdram.d \
./Core/Src/bsp/disco_ts.d \
./Core/Src/bsp/mpu.d \
./Core/Src/bsp/wm8994.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/bsp/%.o Core/Src/bsp/%.su Core/Src/bsp/%.cyclo: ../Core/Src/bsp/%.c Core/Src/bsp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DARM_MATH_CM7 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../FATFS/Target -I../FATFS/App -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../LIBJPEG/App -I../LIBJPEG/Target -I../Middlewares/Third_Party/LibJPEG/include -I../Drivers/CMSIS/DSP/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-bsp

clean-Core-2f-Src-2f-bsp:
	-$(RM) ./Core/Src/bsp/disco_base.cyclo ./Core/Src/bsp/disco_base.d ./Core/Src/bsp/disco_base.o ./Core/Src/bsp/disco_base.su ./Core/Src/bsp/disco_i2c.cyclo ./Core/Src/bsp/disco_i2c.d ./Core/Src/bsp/disco_i2c.o ./Core/Src/bsp/disco_i2c.su ./Core/Src/bsp/disco_lcd.cyclo ./Core/Src/bsp/disco_lcd.d ./Core/Src/bsp/disco_lcd.o ./Core/Src/bsp/disco_lcd.su ./Core/Src/bsp/disco_qspi.cyclo ./Core/Src/bsp/disco_qspi.d ./Core/Src/bsp/disco_qspi.o ./Core/Src/bsp/disco_qspi.su ./Core/Src/bsp/disco_sai.cyclo ./Core/Src/bsp/disco_sai.d ./Core/Src/bsp/disco_sai.o ./Core/Src/bsp/disco_sai.su ./Core/Src/bsp/disco_sdram.cyclo ./Core/Src/bsp/disco_sdram.d ./Core/Src/bsp/disco_sdram.o ./Core/Src/bsp/disco_sdram.su ./Core/Src/bsp/disco_ts.cyclo ./Core/Src/bsp/disco_ts.d ./Core/Src/bsp/disco_ts.o ./Core/Src/bsp/disco_ts.su ./Core/Src/bsp/mpu.cyclo ./Core/Src/bsp/mpu.d ./Core/Src/bsp/mpu.o ./Core/Src/bsp/mpu.su ./Core/Src/bsp/wm8994.cyclo ./Core/Src/bsp/wm8994.d ./Core/Src/bsp/wm8994.o ./Core/Src/bsp/wm8994.su

.PHONY: clean-Core-2f-Src-2f-bsp

