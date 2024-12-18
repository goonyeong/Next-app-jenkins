# 1. Node.js v20 알파인 이미지를 기반으로 시작
FROM node:20-alpine

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. package.json과 package-lock.json을 먼저 복사하여 의존성 설치
COPY package*.json ./

# 4. 의존성 설치
RUN npm install

# 5. Next.js 애플리케이션의 소스 코드 복사
COPY . .

# 6. Next.js 애플리케이션 빌드
RUN npm run build

# 7. 애플리케이션을 실행할 포트 노출
EXPOSE 3000

# 8. 애플리케이션 실행
CMD ["npm", "start"]
