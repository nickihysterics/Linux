#!/bin/bash  
# English: Threshold for switching modems based on signal quality
# Russian: Порог для переключения модемов на основе качества сигнала
SIGNAL_THRESHOLD=10 
# English: How frequently to check the signal quality (in seconds)
# Russian: Как часто проверять качество сигнала (в секундах)
CHECK_INTERVAL=60  
while true; do
  BEST_SIGNAL=0
  BEST_MODEM=""
  
  # English: Iterating over all the modems
  # Russian: Перебираем все модемы
  for MODEM in $(mmcli -L | grep -o "/Modem/[0-9]*"); do
    echo "Checking modem: $MODEM" 
    MODEM_ID=${MODEM//\/Modem\//}
    SIGNAL=$(mmcli -m $MODEM_ID | grep "signal quality" | grep -o '[0-9]*%' | grep -o '[0-9]*')
    echo "Current signal: $SIGNAL" 
    
    # English: If the current modem's signal is better than the best we've seen by SIGNAL_THRESHOLD, update the best modem and signal
    # Russian: Если сигнал текущего модема лучше, чем лучший, который мы видели, на значение SIGNAL_THRESHOLD, обновляем лучший модем и сигнал
    if [ "$SIGNAL" -gt "$(($BEST_SIGNAL + $SIGNAL_THRESHOLD))" ]; then 
      BEST_SIGNAL=$SIGNAL
      BEST_MODEM=$MODEM
    fi
  done
  echo "Best modem: $BEST_MODEM with signal $BEST_SIGNAL" 
  # English: If we found a modem with a sufficiently good signal, connect to it and disconnect all others
  # Russian: Если мы нашли модем с достаточно хорошим сигналом, подключаемся к нему и отключаем все остальные
  if [ ! -z "$BEST_MODEM" ]; then 
    BEST_MODEM_ID=${BEST_MODEM//\/Modem\//}
    mmcli -m $BEST_MODEM_ID --simple-connect="apn=internet"
    for MODEM in $(mmcli -L | grep -o "/Modem/[0-9]*"); do 
      if [ $MODEM != $BEST_MODEM ]; then 
        MODEM_ID=${MODEM//\/Modem\//}
        mmcli -m $MODEM_ID --simple-disconnect
      fi
    done
  fi
  # English: Wait for CHECK_INTERVAL seconds before checking the signal quality again
  # Russian: Ждем CHECK_INTERVAL секунд перед тем как снова проверить качество сигнала
  sleep $CHECK_INTERVAL 
done
