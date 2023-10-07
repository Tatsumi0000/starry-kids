import axios, { AxiosInstance } from "axios";

const axiosClient: AxiosInstance = axios.create({
  baseURL: process.env.VUE_APP_API_BASE_URL,
  headers: {
    "Content-type": "application/json",
  },
});

export default axiosClient;