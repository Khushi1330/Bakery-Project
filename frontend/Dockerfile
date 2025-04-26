FROM node:14-alpine

WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./
RUN npm install

# Copy the rest of the frontend code including public directory
COPY . .

# For React apps, consider building the project for production
# RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]