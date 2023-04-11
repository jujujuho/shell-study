#!/bin/bash

# adb tcpip 5555 포트 열림 유무를 확인하는 함수
check_adb_tcpip_port() {
    result=$(adb tcpip 5555 2>&1) # adb tcpip 명령어 실행 결과를 변수에 저장
    if [[ $result == *"restarting in TCP mode port: 5555"* ]]; then
        echo "adb tcpip 5555 포트가 열렸습니다."
        return 0 # 성공
    else
        echo "adb tcpip 5555 포트가 열리지 않았습니다."
        echo "에러 메시지: $result"
        return 1 # 실패
    fi
}

# adb tcpip 5555 포트가 이미 열려있는지 확인
adb_result=$(adb tcpip 5555 2>&1)
if [[ $adb_result == *"already listening on"* ]]; then
    echo "adb tcpip 5555 포트가 이미 열려있습니다."
    exit 0 # 이미 열려있으므로 종료
fi

# adb tcpip 5555 포트 열림 유무 확인
check_adb_tcpip_port

# adb tcpip 5555 포트가 열리지 않았다면 포트를 열어줌
if [[ $? -ne 0 ]]; then
    adb tcpip 5555
    check_adb_tcpip_port
fi
