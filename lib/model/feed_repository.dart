import 'package:piranti_tugas_rafli/model/feed.dart';

class FeedRepository {
  List<Feed> fetch() {
    return [
      Feed(
          id: 1,
          user: User(
              name: 'Luv',
              avatar:
                  'https://images.pexels.com/photos/22468584/pexels-photo-22468584/free-photo-of-wanita-perempuan-kaum-wanita-bunga-bunga.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              place: 'Asgar, Ibu Pertiwi'),
          content: Content(
              isLike: false,
              image:
                  'https://images.pexels.com/photos/29070341/pexels-photo-29070341/free-photo-of-wanita-afrika-yang-anggun-dengan-payung-di-alam.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              likes: '666 likes',
              description: 'The Black One')),
      Feed(
          id: 2,
          user: User(
              name: 'Luv Another',
              avatar:
                  'https://images.pexels.com/photos/10414204/pexels-photo-10414204.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              place: 'Bandung, Ibu Pertiwi'),
          content: Content(
              isLike: false,
              image:
                  'https://images.pexels.com/photos/29034031/pexels-photo-29034031/free-photo-of-domba-yang-tenang-merumput-di-padang-rumput-yang-subur.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              likes: '777 likes',
              description: 'The Goat')),
      Feed(
          id: 3,
          user: User(
              name: 'Luv Someone',
              avatar:
                  'https://images.pexels.com/photos/28609572/pexels-photo-28609572.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              place: 'Jakarta, Ibu Pertiwi'),
          content: Content(
              isLike: false,
              image:
                  'https://images.pexels.com/photos/28905905/pexels-photo-28905905/free-photo-of-memancing-di-tepi-danau-musim-gugur-di-taman-yang-indah.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              likes: '888 likes',
              description: 'The Mancing')),
      Feed(
          id: 4,
          user: User(
              name: 'Luv Yours',
              avatar:
                  'https://images.pexels.com/photos/19748590/pexels-photo-19748590/free-photo-of-wanita-perempuan-kaum-wanita-terowongan.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              place: 'Bogor, Ibu Pertiwi'),
          content: Content(
              isLike: false,
              image:
                  'https://images.pexels.com/photos/9675789/pexels-photo-9675789.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              likes: '999 likes',
              description: 'The Anjing'))
    ];
  }
}
