clc; clear;

% 날짜와 시간 입력 (예: [2025 9 4 15 30 0])
dt_input = input('날짜와 시간 입력 [년 월 일 시 분 초]: ');

% datetime 객체 생성
t = datetime(dt_input);

% 추가할 시간 입력 (시간 단위)
addHours = input('추가할 시간(시간 단위): ');

% 시간 더하기
t_new = t + hours(addHours);

% 결과 출력
disp('===== 결과 =====');
disp(['입력된 시간: ' datestr(t)]);
disp(['경과 후 시간: ' datestr(t_new)]);
