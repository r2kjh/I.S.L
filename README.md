<I.S.L>

<대한전기학회 2025 자율주행 경진대회>

요약(Abstract)
<대한전기학회 2025 자율주행 경진대회 개발 코드>

목차

1. 기본 정보

2. 연구/개발 주제 개요

3. 시스템 구조 및 설계

4. 실험 환경 및 시뮬레이션 설정

5. 성능 평가

6. 기술적 기여 및 차별점

7. 결론 및 향후 계획

8. 참고문헌 및 자료

9. 부록

설치 및 실행(빠른 시작)

저작권/라이선스

기여 방법

1. 기본 정보

팀명: <I.S.L>

소속(학교/연구실): <강남대학교/I.S.L>

팀원: <고재형(4 학년/학사, 이메일)>, <노수영(3 학기/석사, nsy@kangnam.ac.kr)>

대회/과제: <대회명·라운드/프로젝트 식별자>

연락처: <대표자 이메일/홈페이지/이슈 트래커 링크>

2. 연구/개발 주제 개요

프로젝트 제목: <제목>

개발 목표:

<예: 차선 변경 판단 알고리즘 고도화>

<예: 강화학습 기반 장애물 회피>

연구 배경 및 필요성:

<문제정의/현업·학술적 필요성/기대효과를 간결히 기술>

핵심 기여(한눈에 보기)

✅ <기여1>

✅ <기여2>

✅ <기여3>

3. 시스템 구조 및 설계
3.1 전체 시스템 블록 다이어그램

아래 Mermaid 블록을 수정해 시스템 파이프라인을 시각화하세요.

flowchart LR
    A[Sensor Suite<br/>(Camera/Radar/LiDAR)] --> B[Perception<br/>(Lane/Objects)]
    B --> C[Sensor Fusion]
    C --> D[Planning<br/>(Lane Keep/Change/Cut-in)]
    D --> E[Control<br/>(LQR/SS-PID/MPC/RL)]
    E --> F[Vehicle Model/Actuators]
    F -- feedback --> A

3.2 사용 툴박스/프레임워크

MATLAB/Simulink: Automated Driving Toolbox, Navigation Toolbox, Reinforcement Learning Toolbox, …

RoadRunner / Scenario: <버전/프로젝트 경로/핵심 리소스>

기타: ROS/ROS2, Python(NumPy, PyTorch/TF), …

3.3 알고리즘 설계 개요

차선 인식 및 유지: <방법(예: Canny+Hough/Deep Learning/Koopman+DMD 특징 등)>

차선 변경/Planner 로직: <FSM/Behavior Planner/Trajectory Optimizer>

장애물 회피 및 경로 재계산: <예: DWA/MPC/RRT*/Bezier>

Cut-in 대응 전략: <예: 위험도 추정+GAP 선택+속도 프로파일 생성>

기타 구현 기능: <ACC/Stop&Go/합류·분기 대응 등>

설계 선택 근거

성능: <지표> / 복잡도: <O(·)> / 실시간성: <주기(ms)> / 견고성: <노이즈/유실 대응>

4. 실험 환경 및 시뮬레이션 설정

맵/시나리오: <RoadRunner 씬, 이벤트, Traffic Actor 배치>

차량 모델 & 센서 구성: <Vehicle params, Camera/Radar/LiDAR FOV/주파수/노이즈>

주요 시나리오:

(S1) 직선 구간 차선 유지 — <조건/목표>

(S2) 곡선 + 장애물 회피 — <조건/목표>

(S3) Cut-in 대응 — <조건/목표>

재현 방법: scripts/run_scenario_<ID>.m 또는 <.mlx/.slx> 실행

하드웨어/소프트웨어 사양: <CPU/GPU/RAM/OS/MATLAB 버전 등>

5. 성능 평가
5.1 평가 지표

주행 성능: 평균/최대 완주 시간, 차선 이탈률, 충돌률

효율성: 경로 길이/곡률/제어 입력 스무딩, 연비 지표(선택)

안정성/쾌적성: 횡가속/요율 RMS, 오버슈트, 제어 에너지

5.2 결과 (표/그래프 자리)
시나리오	완주 시간(s)	차선 이탈(%)	충돌 횟수	비고
S1	<값>	<값>	<값>	
S2	<값>	<값>	<값>	
S3	<값>	<값>	<값>	

그래프/그림 경로: docs/results/<fig>.png

Lap별 안정성 비교, 제어입력 스펙트럼, 추종 오차 히스토그램 등 첨부 권장

6. 기술적 기여 및 차별점

기본 예제 대비 차별성: <모듈/알고리즘/데이터/평가 프로토콜>

장점: <일반화/실시간성/견고성/튜닝 용이성>

한계 및 개선 방향: <경계조건/성능 병목/추가 학습/실차 이전 계획>

7. 결론 및 향후 계획

최종 성과 요약: <핵심 수치/성능 승수/주요 발견>

향후 연구: <강화학습 고도화/실차 적용/센서 증강/Koopman·DMD 확장 등>

8. 참고문헌 및 자료

<저자>, “<제목>,” 저널/학회, 연도. DOI: <DOI>

Brunton, Proctor, Kutz, “Koopman invariant subspaces…,” Proc. of the National Academy of Sciences / 기타 권위 있는 매체 또는 저널명 기입, <연도>.

MathWorks Docs: Automated Driving Toolbox, RoadRunner, …

코드·데이터 레퍼런스: <GitHub/Dataset/매뉴얼 링크>

인용 규칙: 대회/논문 규격(예: KIEE/IEEE/APA 7th)을 따라 통일

9. 부록
9.1 코드 구조도
.
├─ docs/                # 문서, 그림, 결과물
├─ scenarios/           # RoadRunner 설정/자산
├─ models/              # 학습/식별/튜닝된 모델
├─ sim/                 # Simulink(.slx/.mlx) 및 설정 스크립트
├─ src/                 # 알고리즘 소스(Perception/Planning/Control)
│  ├─ perception/
│  ├─ planning/
│  └─ control/
├─ scripts/             # 재현/평가 스크립트(run_*.m, eval_*.m)
├─ data/                # 로그/리플레이/파라미터
└─ tests/               # 단위/통합 테스트

9.2 주요 함수/블록 설명

src/planning/<file>.m: <기능/입출력/주기>

sim/<model>.slx: <최상위 모델·I/O 신호 정의>

9.3 추가 캡처/영상 링크

YouTube/Drive: <링크>

스냅샷: docs/img/<name>.png

설치 및 실행(빠른 시작)

요구사항: <MATLAB R20xxb+, RoadRunner x.y, Python 3.10+, 기타>

# (옵션) Python 패키지
pip install -r requirements.txt

# MATLAB: 시나리오 실행(예)
matlab -batch "run('scripts/run_scenario_S1.m')"

# 결과 평가
matlab -batch "run('scripts/eval_all.m')"

저작권/라이선스

본 프로젝트는 <MIT/BSD-3/Apache-2.0> 라이선스를 따릅니다. 자세한 내용은 LICENSE
를 참조하세요.

사용한 외부 데이터/모델/자산의 라이선스는 각 출처의 규정을 따릅니다.

기여 방법

이슈/PR 환영합니다! 가이드: CONTRIBUTING.md

코드 스타일/테스트: <lint/CI/테스트 규칙>

체크리스트:

 시나리오 재현 스크립트 업데이트

 docs/results 결과물 반영

 레퍼런스/라이선스 검토 완료

배지(수정용)
