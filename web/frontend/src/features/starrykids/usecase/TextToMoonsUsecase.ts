import { TextToMoonsRepository } from "../repository/TextToMoonsRepository";
import { TextToMoonsRequest, TextToMoonsResponse } from "../model/TextToMoons";

interface TextToMoonsUsecase {
  getMoons(request: TextToMoonsRequest): Promise<TextToMoonsResponse>;
}

export default class TextToMoonsUsecaseImpl implements TextToMoonsUsecase {
  constructor(private repository: TextToMoonsRepository) {}

  async getMoons(request: TextToMoonsRequest): Promise<TextToMoonsResponse> {
    return await this.repository.getMoons(request);
  }
}
