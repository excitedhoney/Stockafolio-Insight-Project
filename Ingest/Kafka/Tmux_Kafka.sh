#!/bin/bash
IP_ADDR=$1
SESSION=de-ny-karthik-kafka
ID=1
tmux new-session -s $SESSION -n bash -d
tmux new-window -t $ID
tmux send-keys -t $SESSION:$ID 'python kafka_Producer.py '"$IP_ADDR"' '"$ID"'' C-m

sleep 10

ID=2
tmux new-window -t $ID
tmux send-keys -t $SESSION:$ID 'PYSPARK_PYTHON=/home/ubuntu/miniconda3/bin/python3.5 spark-submit --master spark://ip-172-31-0-100:7077 --jars /home/ubuntu/Insight-Project/Stream_Spark/spark-streaming-kafka-0-8-assembly_2.11-2.1.0.jar /home/ubuntu/Insight-Project/Stream_Spark/Trades.py '"$ID"'' C-m



