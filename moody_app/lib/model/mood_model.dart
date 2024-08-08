class MoodModel {
  final String? mood;
  final String? video;
  final String? description;
  double rating;

  MoodModel({
    required this.mood,
    required this.description,
    required this.video,
    required this.rating,
  });
}

final List<MoodModel> moods = [
  MoodModel(
    mood: "Happy",
    description:
        "Feeling joyous and light-hearted, with a natural smile and a sense of contentment. Everything seems brighter, and laughter comes easily.",
    video: "happy.mp4",
    rating: 0,
  ),
  MoodModel(
    mood: 'Sad',
    description:
        "A sad mood involves feelings of sorrow or disappointment, often marked by a lack of energy and interest in activities. It can result from personal losses or negative events and may lead to withdrawal from social interactions and changes in sleep or appetite.",
    video: "sad.mp4",
    rating: 0,
  ),
  MoodModel(
    mood: 'Excited',
    description:
        "An excited mood is characterized by high energy, enthusiasm, and eagerness. It often involves a heightened sense of anticipation and joy, making activities feel more engaging and enjoyable. People in an excited mood are usually more sociable, motivated, and focused on their goals or upcoming events.",
    video: "exited.mp4",
    rating: 0,
  ),
  MoodModel(
    mood: 'Relaxed',
    description:
        "A relaxed mood is characterized by a sense of calm and ease. It involves feeling at peace, without stress or tension, and often includes a positive outlook and comfort. People in a relaxed mood are usually more open to enjoying their surroundings and engaging in leisure activities.",
    video: "Relaxed.mp4",
    rating: 0,
  ),
  MoodModel(
    mood: 'anger',
    description:
        "An angry mood is characterized by intense feelings of irritation, frustration, or rage. It often involves a strong reaction to perceived injustices or threats, leading to heightened physical responses like increased heart rate and tense muscles. People may express anger through aggressive behavior or verbal outbursts and might struggle with controlling their emotions.",
    video: "anger.mp4",
    rating: 0,
  ),
  MoodModel(
    mood: 'Anxious',
    description:
        "An anxious mood is characterized by feelings of worry, nervousness, or unease. It often involves heightened alertness, restlessness, and a sense of impending danger or dread. People may experience physical symptoms like a racing heart, sweating, or muscle tension.",
    video: "Anxious.mp4",
    rating: 0,
  ),
  MoodModel(
    mood: 'Guilty',
    description:
        "A guilty mood involves feelings of remorse or regret for a perceived wrongdoing or mistake. It often leads to a sense of unease or self-blame, making it difficult to feel at ease or find satisfaction.",
    video: "Guilty.mp4",
    rating: 0,
  ),
  MoodModel(
    mood: 'Playful',
    description:
        "A playful mood is characterized by a sense of fun, lightheartedness, and enthusiasm. It often involves a desire to engage in playful activities, humor, and spontaneous interactions. People in a playful mood feel energetic, carefree, and open to experimenting with new ideas or games.",
    video: "playing.mp4",
    rating: 0,
  ),
];
