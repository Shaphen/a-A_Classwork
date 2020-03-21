Artwork.create!([
  {title: "Famine", img_url: "starving.io", artist_id: 1},
  {title: "HotShit", img_url: "imhot.io", artist_id: 2},
  {title: "doodles", img_url: "doodle.io", artist_id: 3}
])
ArtworkShare.create!([
  {artwork_id: 2, viewer_id: 1},
  {artwork_id: 3, viewer_id: 3},
  {artwork_id: 4, viewer_id: 3},
  {artwork_id: 4, viewer_id: 2},
  {artwork_id: 2, viewer_id: 2}
])
Comment.create!([
  {user_id: 1, artwork_id: 3, body: "im hungry"}
])
User.create!([
  {username: "BlackDragon9000"},
  {username: "jmiggsdoe"},
  {username: "VeryHungry"}
])
