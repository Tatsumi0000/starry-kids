import { TextToMoonsRequest, TextToMoonsResponse } from "../model/TextToMoons";
import { AxiosInstance, isAxiosError } from "axios";
import * as qs from "qs";
import axiosClient from "../client/AxiosClient";

export interface TextToMoonsRepository {
  getMoons(request: TextToMoonsRequest): Promise<TextToMoonsResponse>;
}

export class TextToMoonsRepositoryImpl implements TextToMoonsRepository {
  constructor(private client: AxiosInstance = axiosClient) {}
  private urlPath = "/text_to_moons";

  async getMoons(request: TextToMoonsRequest): Promise<TextToMoonsResponse> {
    const params = qs.stringify(request);
    try {
      const response = await this.client.get<TextToMoonsResponse>(
        `${this.urlPath}?${params}`,
      );
      return response.data;
    } catch (error) {
      // TODO: 後でエラーハンドリングをちゃんとする
      if (isAxiosError(error)) {
        throw new Error(error.response?.data);
      }
      throw new Error("Unknown error");
    }
  }
}
