import * as dotenv from "dotenv";
dotenv.config();

export function getAllowedCorsOrigins() {
  return process.env.CORS_ALLOWED_ORIGIN || 'http://localhost:3000';
}

export function getServerListeningPort() {
  return process.env.PORT || 4200;
}

export function getCallDurationInSeconds() {
  return parseInt(process.env.CALL_DURATION_IN_SECONDS ?? '', 10) || 180;
}