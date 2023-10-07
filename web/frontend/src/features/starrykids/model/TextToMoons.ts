export type TextToMoonsRequest = {
  text: string;
  size?: number;
};

export type TextToMoonsResponse = {
  text: string;
  size: number;
  response: string[];
};
