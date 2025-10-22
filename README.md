<I.S.L> - 대한전기학회 2025 자율주행 경진대회

요약(Abstract)

본 프로젝트는 MathWorks의 HighwayLaneFollowingWithRRScenarioExample 예제를 기반으로, <대한전기학회 2025 자율주행 경진대회>의 공식 시나리오에 맞게 자율주행 시스템을 수정한 개발 보고서입니다. 특히, 대회 시나리오의 특징인 급격한 커브 구간과 조명 변화(그림자)가 포함된 구간에서 안정적인 차선 인식을 위해 Bird's-Eye-View(BEV) 이미지 프로세싱 파라미터와 차선 유효성 검사 로직(validateBoundaryFcn)을 집중적으로 튜닝하여 주행 안정성을 확보하는 것을 목표로 합니다.

목차

기본 정보

연구/개발 주제 개요

시스템 구조 및 설계

실험 환경 및 시뮬레이션 설정

성능 평가

기술적 기여 및 차별점

결론 및 향후 계획

참고문헌 및 자료

부록

설치 및 실행(빠른 시작)

저작권/라이선스

기여 방법

1. 기본 정보

팀명: <I.S.L>

소속(학교/연구실): <강남대학교/I.S.L>

팀원:

<고재형 (4학년/학사, 이메일)>

<노수영 (3학기/석사, nsy@kangnam.ac.kr)>

대회/과제: <대한전기학회 2025 자율주행 경진대회>

연락처: nsy@kangnam.ac.kr

2. 연구/개발 주제 개요

프로젝트 제목: 급커브 및 그림자 환경에 강인한 BEV 기반 차선 추종 알고리즘 개발

개발 목표:

MathWorks HighwayLaneFollowingWithRRScenarioExample 템플릿을 대회 시나리오에 맞게 최적화

급커브 구간에서 안정적인 차선 추종 및 주행

그림자 등 저조도 환경에서 BEV 인식률 향상을 통한 차선 검출 안정화

연구 배경 및 필요성:

기본 HLF(Highway Lane Following) 예제는 일반적인 고속도로 환경을 가정하여 설계되었습니다.

하지만 본 대회 시나리오는 급격한 곡률 변화를 포함하며, 특정 구간에 그림자가 짙게 드리워져 BEV(Bird's-Eye-View) 변환 시 원거리 차선 정보가 불확실해지고 노이즈가 발생하는 문제가 있습니다.

이로 인해 기존 파라미터로는 차선을 정확히 추정하지 못하고 주행이 불안정해지는 현상이 발생, 대회 시나리오 맞춤형 파라미터 튜닝 및 로직 수정이 필수적입니다.

핵심 기여(한눈에 보기)

✅ MathWorks HLF 예제를 기반으로 대회 시나리오(급커브, 그림자) 맞춤형 수정

✅ BEV 이미지 프로세싱 파라미터 튜닝 (그림자/불확실한 원거리 영역 대응)

✅ validateBoundaryFcn 내 곡률 제한 등 차선 유효성 검사 로직 수정

3. 시스템 구조 및 설계

3.1 전체 시스템 블록 다이어그램

(시스템 다이어그램 이미지 또는 설명을 이곳에 삽입하세요. 예: docs/system_diagram.png)

3.2 사용 툴박스/프레임워크

MATLAB/Simulink: Automated Driving Toolbox, Image Processing Toolbox

RoadRunner / Scenario: 대회 공식 제공 시나리오 맵 및 .rrscenario 파일

기타: (해당 시 작성)

3.3 알고리즘 설계 개요

차선 인식 및 유지:

MathWorks 예제 기반의 BEV(Bird's-Eye-View) 파라볼릭 차선 검출기(findParabolicLaneBoundaries)를 사용합니다.

$$핵심 수정 사항$$

$$$$대회 시나리오(급커브, 그림자) 대응을 위해 validateBoundaryFcn 및 관련 이미지 프로세싱 파라미터를 집중 튜닝했습니다.

수정된 주요 파라미터:

validateBoundaryFcn: 최대 곡률 제한 (latDeltaMax 등) 수정

BEV 이미지 처리: 차선 분할 민감도(LaneSegmentationSensitivity), 차선 마커 폭(ApproximateLaneMarkerWidth), 차선 강도 임계값(LaneStrengthThreshold) 등 조정

ROI 설정: vehicleROI 조정

참고: 정확한 파라미터 값은 코드 보안상 기재하지 않습니다.

설계 선택 근거:

대회 준비 기간과 리소스를 고려하여, 신규 알고리즘 개발보다는 검증된 MathWorks 템플릿을 기반으로 파라미터 튜닝 및 로직 최적화에 집중하는 전략을 선택했습니다.

이를 통해 복잡한 딥러닝 모델 학습 없이도 특정 환경(대회 맵)에 대한 주행 강인성을 확보하고자 했습니다.

4. 실험 환경 및 시뮬레이션 설정

맵/시나리오: <대한전기학회 2025 자율주행 경진대회> 공식 제공 RoadRunner 씬 및 시나리오 (급커브, 그림자 구간 포함)

차량 모델 & 센서 구성:

Vehicle: Simulation 3D Vehicle with Ground Following (기본 파라미터)

Sensor: Simulation 3D Camera (BEV 인식을 위한 파라미터 튜닝)

주요 시나리오:

(S1) 기본 직선/완만한 곡선 구간 차선 유지

(S2) 대회 시나리오 - 급커브 구간 주행

(S3) 대회 시나리오 - 그림자 및 저조도 구간 주행

재현 방법: HighwayLaneFollowingWithRRScenarioExample.mlx (또는 .slx) 파일 실행 (대회 시나리오 로드 설정 확인 필요)

하드웨어/소프트웨어 사양:

CPU: <예: Intel i7-12700K>

GPU: <예: NVIDIA RTX 4090>

RAM: <예: 32GB>

OS: <예: Windows 11>

Software: MATLAB R2024a, RoadRunner R2024a (버전 명시)

5. 성능 평가

5.1 평가 지표

주행 성능: 시나리오 완주 시간, 차선 이탈률, 충돌률

안정성/쾌적성: 횡방향 이탈 오차(Lateral Deviation) RMS, 요율(Yaw Rate) RMS

5.2 결과 (표/그래프 자리)

현재 튜닝 진행 중이며, 아래 표는 기본 예제 대비 성능 개선 상태를 나타냅니다.

시나리오별 주행 안정성 비교 (진행 중)

시나리오

튜닝

완주 여부

차선 이탈(%)

비고

S2 (급커브)

튜닝 전

실패

-

곡률 추종 실패로 이탈

S2 (급커브)

튜닝 후

진행 중

-

기본 예제 대비 검출 시간 향상, 여전히 한계 존재

S3 (그림자)

튜닝 전

실패

-

차선 검출 실패로 이탈

S3 (그림자)

튜닝 후

진행 중

-

강인성 일부 향상, 강한 저조도에서 추출 실패

그래프 경로: docs/results/S2_Lateral_Deviation_InProgress.png
(급커브 구간 횡방향 오차 튜닝 진행 상황)

그래프 경로: docs/results/S3_BEV_Perception_InProgress.png
(그림자 구간 BEV 인식 결과 튜닝 진행 상황)

6. 기술적 기여 및 차별점

기본 예제 대비 차별성:

본 프로젝트는 HighwayLaneFollowingWithRRScenarioExample 예제를 단순히 실행하는 것을 넘어, 실제 복잡한 대회 시나리오(급커브, 조명 변화)에 적용하기 위한 BEV 인식 파라미터 최적화 및 차선 유효성 검사 로직(validateBoundaryFcn) 수정에 중점을 두었습니다.

장점:

별도의 딥러닝 모델 학습이나 복잡한 알고리즘(예: EKF, Particle Filter) 추가 없이, 기존 알고리즘의 파라미터 튜닝만으로 특정 환경(대회 맵)에 대한 차선 인식 강인성을 확보했습니다.

한계 및 개선 방향:

현재 튜닝된 파라미터가 대회 시나리오에 과적합(overfitting)되어, 다른 일반 도로 환경에서의 주행 성능이 저하될 수 있습니다.

조도 변화에 실시간으로 대응하기 위한 동적 파라미터 튜닝 로직이 부재합니다.

7. 결론 및 향후 계획

최종 성과 요약: MathWorks HLF 템플릿을 기반으로 BEV 인식 파라미터 및 차선 유효성 검사 로직을 수정하여, 대회 시나리오의 급커브 및 그림자 구간 대응을 시도하고 있습니다. 튜닝을 통해 기본 예제 대비 강인성이 일부 향상되었으나, 강한 곡선 및 저조도 환경에서는 여전히 차선 추출에 한계가 있어 추가 개선이 필요합니다.

향후 연구:

조도 값에 따라 BEV 파라미터를 실시간으로 변경하는 동적 튜닝 알고리즘 적용

칼만 필터(EKF) 또는 파티클 필터(Particle Filter)를 도입하여 차선 추정(Estimation) 로직 고도화

8. 참고문헌 및 자료

MathWorks Documentation (R2024a), "Highway Lane Following with RoadRunner Scenario Example," Automated Driving Toolbox.

<저자>, “<제목>,” 저널/학회, 연도. DOI: <DOI>

(기타 참고한 레퍼런스 기입)

9. 부록

9.1 코드 구조도

.
├─ docs/                 # 문서, 그림, 결과물
├─ scenarios/            # RoadRunner 설정/자산 (대회 제공 파일)
├─ models/               # (사용한 경우)
├─ sim/                  # Simulink(.slx) 및 설정 스크립트
│  └─ HighwayLaneFollowingWithRRScenarioExample.slx (수정됨)
├─ src/                  # 알고리즘 소스(M-Function 등)
│  └─ planning/
│     └─ validateBoundaryFcn.m (수정됨)
├─ scripts/              # 재현/평가 스크립트
│  └─ helperSLHighwayLaneFollowingWithRRSetup.m (수정됨)
└─ data/                 # 로그/리플레이/파라미터




9.2 주요 함수/블록 설명

sim/HighwayLaneFollowingWithRRScenarioExample.slx:

최상위 시뮬레이션 모델. 대회 시나리오 구동을 위해 helperSLHighwayLaneFollowingWithRRSetup 스크립트를 호출합니다.

scripts/helperSLHighwayLaneFollowingWithRRSetup.m:

시뮬레이션 초기 설정 스크립트.

$$수정$$

$$$$BEV 파라미터(LaneSegmentationSensitivity 등) 및 validateBoundaryFcn 관련 파라미터( latDeltaMax 등)를 정의하고 Base Workspace에 할당합니다.

src/planning/validateBoundaryFcn.m (또는 해당 M-Function 블록):

findParabolicLaneBoundaries의 콜백 함수.

$$수정$$

$$$$급커브 대응을 위해 차선의 유효성(곡률, 폭) 판단 기준을 수정했습니다.

설치 및 실행(빠른 시작)

요구사항:

MATLAB R2024a (또는 호환 버전)

Simulink

Automated Driving Toolbox

Image Processing Toolbox

RoadRunner R2024a (또는 호환 버전)

(대회 제공 RoadRunner 에셋)

실행 방법:

대회 제공 RoadRunner 프로젝트 및 시나리오가 올바르게 설치되었는지 확인합니다.

MATLAB에서 HighwayLaneFollowingWithRRScenarioExample.mlx (또는 .slx) 파일을 엽니다.

(필요시) helperSLHighwayLaneFollowingWithRRSetup.m 스크립트에서 시나리오 파일 이름(nvp.scenarioFileName)을 대회 시나리오로 변경합니다.

Simulink 모델을 실행(Run)합니다.

저작권/라이선스

본 프로젝트는 <MIT/BSD-3/Apache-2.0 중 선택, 또는 대회 규정 명시> 라이선스를 따릅니다. 자세한 내용은 LICENSE 파일을 참조하세요.

MathWorks에서 제공한 기본 예제 코드의 저작권은 The MathWorks, Inc.에 있습니다.

기여 방법

이슈/PR 환영합니다! (대회 종료 후)
