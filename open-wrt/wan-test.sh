#!/bin/ash

source /tmp/network_vars

TARGET=8.8.8.8
MQTT_SERVER= # MQTT Server IP or Hostname

TIMESTAMP=$(date)

echo $NET1
MAIN_ISP="$NET1"
MAIN_ISP_INTERFACE=pppoe-wan
MAIN_ISP_TOPIC=MainWanStatus
MISP_WEIGHT=0

SECOND_ISP=$NET2
SECOND_ISP_INTERFACE=lan1
SECOND_ISP_TOPIC=AltWanStatus
SISP_WEIGHT=1

test_isp() {
	ISP=$1
	INTERFACE=$2
	TOPIC=$3
	WEIGHT=$4

	MESSAGE="{\"timestamp\":\"$TIMESTAMP\", \"isp\":\"$ISP\", \"weight\": \"$WEIGHT\", \"value\": \"1\", \"message\": \"$ISP-OK\"}"

        ping -I $INTERFACE -W1 -c1 $TARGET

        if [ $? -eq 1 ]; then
                MESSAGE="{\"timestamp\":\"$TIMESTAMP\",\"isp\":\"$ISP\", \"weight\": \"$WEIGHT\",  \"value\": \"0\", \"message\": \"$ISP-FAIL\"}"
                mosquitto_pub -h $MQTT_SERVER -t $TOPIC -m "$MESSAGE" -r
        else
		echo $MQTT_SERVER $TOPIC $MESSAGE
                mosquitto_pub -h $MQTT_SERVER -t $TOPIC -m "$MESSAGE" -r
        fi
}

test_isp "$MAIN_ISP" $MAIN_ISP_INTERFACE $MAIN_ISP_TOPIC $MISP_WEIGHT
test_isp "$SECOND_ISP" $SECOND_ISP_INTERFACE $SECOND_ISP_TOPIC $SISP_WEIGHT