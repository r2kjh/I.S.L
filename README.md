<I.S.L> - 대한전기학회 2025 자율주행 경진대회
개발 내용
본 프로젝트는 MathWorks의 <대한전기학회 2025 자율주행 경진대회> 시뮬레이션을 수행합니다.

시뮬레이션 루프에서 현재 차량의 속도(Current Vehicle Speed)를 피드백으로 직접 받아와 속도를 제어하는 PID 제어기를 구현했습니다.

이 PID 제어기는 설정된 목표 속도(Target Speed)와 현재 속도 간의 오차(Error)를 기반으로 필요한 가속(Acceleration) 및 제동(Brake) 명령을 생성하며, 차량의 종방향 제어를 담당합니다.

또한, 이미지 및 레이더 센서 값을 가져오기 위해 Simulation 3D Scene Configuration 블록을 사용하였습니다. Simulation 3D Vehicle with Ground Following 1 블록을 추가로 생성하여, RoadRunner 시나리오에서 보내주는 차량의 위치(Position) 및 회전(Rotation) 값을 받아 연동하는 코시뮬레이션(Co-simulation) 환경을 구축했습니다. 이를 통해 시나리오상의 차량 움직임을 그대로 따르면서 영상 및 레이더 데이터를 실시간으로 읽어왔습니다.
