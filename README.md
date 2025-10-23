<I.S.L> - 2025 대한전기학회 자율주행 경진대회 기술 문서

1. 개요 (Overview)

본 문서는 MathWorks의 MATLAB, Simulink 및 RoadRunner 환경을 기반으로 수행한 <대한전기학회 2025 자율주행 경진대회>의 시스템 개발 내용에 대해 기술합니다.

본 I.S.L 팀의 시스템은 RoadRunner의 고정밀 시나리오 재현 능력과 Simulink의 강력한 3D 시뮬레이션 및 제어 로직 설계 기능을 유기적으로 연동하는 코시뮬레이션(Co-Simulation) 환경에 중점을 두었습니다.

핵심 과제는 RoadRunner 시나리오 상의 차량 움직임을 실시간으로 Simulink 3D 환경에 복제하여, 시나리오와 완벽하게 동기화된 고충실도(High-Fidelity)의 가상 센서 데이터를 생성하고, 이를 기반으로 안정적인 종방향 제어를 구현하는 것입니다.

2. 핵심 아키텍처: Co-Simulation 환경 구축

2.1. 아키텍처 설계 배경

본 대회에서 RoadRunner는 시나리오 내 모든 객체(Ego 차량, T-Car 등)의 위치와 거동을 정의하는 시뮬레이터(Simulator) 역할을 수행합니다. 하지만 알고리즘 개발에 필수적인 가상 센서 데이터(카메라, 레이더 등)는 RoadRunner 시뮬레이션 루프에서 직접 생성되지 않습니다.

이러한 한계를 극복하기 위해, I.S.L 팀은 RoadRunner를 **'주 시뮬레이터(Main Simulator) 겸 뷰어(Viewer)'**로 활용하고, Simulink의 3D 시뮬레이션 환경을 **'가상 센서 생성기(Virtual Sensor Generator)'**로 활용하는 Co-Simulation 아키텍처를 채택했습니다.

2.2. Co-Simulation 상세 로직

본 시스템의 Co-Simulation 환경은 다음과 같은 두 가지 핵심 블록을 통해 구현됩니다.

Simulation 3D Scene Configuration (가상 환경 구축)

Simulink 내에 RoadRunner 시나리오와 동일한 씬(Scene)을 불러와 병렬적인 3D 가상 환경을 구축합니다. 이 환경이 실제 센서 데이터 생성을 담당합니다.

Simulation 3D Vehicle with Ground Following 1 (상태 값 동기화)

RoadRunner 시뮬레이션 루프로부터 Ego 차량을 포함한 모든 차량의 실시간 위치(Position) 및 회전(Rotation) 상태 값을 전송받습니다.

이 상태 값을 Simulink의 3D 가상 환경에 '주입(Inject)'하여, RoadRunner 내 차량의 움직임과 1:1로 동기화되는 '디지털 트윈' 차량을 복제합니다.

이 아키텍처를 통해, RoadRunner의 차량 움직임을 그대로 따르는 Simulink 3D 환경의 복제 차량에서 카메라 이미지 및 레이더 탐지(Radar Detections) 데이터를 실시간으로 취득할 수 있습니다.

3. 핵심 구현 모듈

3.1. 센서 데이터 취득 (Sensor Acquisition)

앞서 구축된 Co-Simulation 환경을 기반으로, Simulation 3D Scene Configuration 블록에 연결된 가상 센서 모듈을 통해 다음 데이터를 취득합니다.

가상 카메라 (Vision Sensor): 전방 주행 환경의 RGB 이미지를 실시간으로 스트리밍하여 차선 인식 및 객체 탐지의 입력으로 사용합니다.

가상 레이더 (Radar Sensor): 전방 차량 및 장애물과의 거리, 상대 속도 등 레이더 탐지 정보를 취득하여 종방향 제어 및 충돌 방지 로직의 입력으로 사용합니다.

3.2. 종방향 제어 (Longitudinal Control)

차량의 안정적인 속도 유지를 위해 PID 제어기 기반의 종방향 제어 시스템을 구현했습니다.

피드백 (Feedback): Simulink 모델은 시뮬레이션 루프로부터 차량의 **현재 속도(Current Vehicle Speed)**를 실시간으로 피드백 받습니다.

참조 (Reference): 상위 판단 로직(본 시뮬레이션에서는 설정값)에서 계산된 **목표 속도(Target Speed)**를 참조 입력으로 받습니다.

제어 로직: PID 제어기는 목표 속도와 현재 속도 간의 **오차(Error)**를 기반으로, 이를 보상하기 위한 제어 입력을 생성합니다.

출력 (Output): 제어 입력은 차량 동역학 모델이 요구하는 가속(Acceleration) 및 제동(Brake) 명령으로 변환되어, 차량의 종방향 속도를 목표 속도로 수렴시킵니다.

4. 결론

I.S.L 팀은 RoadRunner와 Simulink 3D 환경을 연동하는 Co-Simulation 아키텍처를 성공적으로 구축하였습니다. 이 접근 방식을 통해 RoadRunner의 시나리오를 그대로 활용하면서도, 알고리즘 개발에 필수적인 고충실도의 카메라 및 레이더 센서 데이터를 실시간으로 생성할 수 있었습니다.

이를 기반으로 구현된 PID 종방향 제어기는 안정적인 속도 추종 성능을 보였습니다. 본 시스템 아키텍처는 향후 인지 및 판단 알고리즘을 추가로 통합하고 고도화하는 데 견고한 기반이 될 것입니다.
