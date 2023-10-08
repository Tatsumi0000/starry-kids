import axios, { AxiosInstance } from "axios";

console.log("----");
console.log(import.meta.env.VITE_API_BASE_URL);
console.log(import.meta.env.MODE);

const axiosClient: AxiosInstance = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL,
  headers: {
    "Content-type": "application/json",
    "Access-Control-Allow-Origin": "*",
  },
});

export default axiosClient;
