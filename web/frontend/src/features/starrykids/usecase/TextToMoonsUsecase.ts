import {
  TextToMoonsRepository,
  TextToMoonsRepositoryImpl,
} from "../repository/TextToMoonsRepository";
import { TextToMoonsRequest, TextToMoonsResponse } from "../model/TextToMoons";

export interface TextToMoonsUsecase {
  getMoons(request: TextToMoonsRequest): Promise<TextToMoonsResponse>;
}

export class TextToMoonsUsecaseImpl implements TextToMoonsUsecase {
  constructor(
    private repository: TextToMoonsRepository = new TextToMoonsRepositoryImpl(),
  ) {}

  async getMoons(request: TextToMoonsRequest): Promise<TextToMoonsResponse> {
    return await this.repository.getMoons(request);
  }
}
