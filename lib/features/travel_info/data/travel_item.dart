class TravelItem {
  const TravelItem({
    required this.title,
    required this.phrase,
    required this.description,
    required this.imageUrl,
  });

  final String title;
  final String phrase;
  final String description;
  final String imageUrl;
}

const travelItems = [
  TravelItem(
    title: 'Bosques',
    phrase: 'Donde el aire huele a vida',
    description:
        'Los bosques de pino-encino cubren las sierras de México con una '
        'biodiversidad única. Aves endémicas, mamíferos y hongos que no '
        'existen en otro lugar cohabitan bajo un dosel que regula el clima '
        'y protege las cuencas hidrológicas del país.',
    imageUrl:
        'https://www.gob.mx/cms/uploads/image/file/520949/Hidalgo_Panoramica-de-Mineral-del-chico_web.jpg',
  ),
  TravelItem(
    title: 'Selvas',
    phrase: 'El verde que nunca duerme',
    description:
        'Las selvas tropicales del sureste son hogar del jaguar, el quetzal '
        'y miles de especies vegetales. Una lluvia constante alimenta una '
        'vegetación exuberante que guarda secretos milenarios y las '
        'tradiciones vivas de los pueblos originarios.',
    imageUrl:
        'https://www.turimexico.com/wp-content/uploads/2015/07/selvas.jpg',
  ),
  TravelItem(
    title: 'Desiertos',
    phrase: 'La belleza que sobrevive',
    description:
        'El desierto chihuahuense es el más grande de Norteamérica. Cactáceas '
        'gigantes, zorras del desierto y halcones peregrinos habitan un '
        'paisaje que parece inhóspito pero late con una vitalidad '
        'extraordinaria bajo el sol implacable.',
    imageUrl:
        'https://luxurymag.mx/wp-content/uploads/2024/04/baja_california_sur-1390x782.jpg',
  ),
  TravelItem(
    title: 'Arrecifes',
    phrase: 'Ciudades bajo el mar',
    description:
        'México custodia el segundo arrecife de coral más grande del mundo. '
        'Tortugas marinas, mantarrayas y miles de peces de colores dan vida '
        'a un ecosistema frágil que depende del equilibrio del océano '
        'para sobrevivir.',
    imageUrl:
        'https://cdn.prod.website-files.com/65441775eadc83ef91876793/68efe4e852df08c95a07cadd_68e544b70851f6ff5125fb41_659c388db216a7c31e4a8847_reefs_de_coral_miles_de_peces_rutopia-scaled.jpeg',
  ),
  TravelItem(
    title: 'Humedales',
    phrase: 'Donde la tierra y el agua se abrazan',
    description:
        'Los manglares y lagunas costeras son criaderos naturales de '
        'incontables especies marinas. Flamencos, pelícanos y garzas '
        'conviven en estos ecosistemas frontera que protegen las costas '
        'y nutren toda la cadena alimentaria del litoral.',
    imageUrl:
        'https://www.mexicosocial.org/wp-content/uploads/2024/10/Los-10-Humedales-mas-Importantes-de-Mexico-y-las-Amenazas-que-Enfrentan.jpg',
  ),
];
