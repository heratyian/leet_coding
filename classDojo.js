const input = `photo.jpg, Warsaw, 2013-09-05 14:08:15
Jay.png, London, 2015-06-20 15:13:22
myFriends.png, Warsaw, 2013-09-05 14:07:13
Eiffel.jpg, Paris, 2015-07-23 08:03:02
pisatower.jpg, Paris, 2015-07-22 23:59:59
BOB.jpg, London, 2015-08-05 00:02:03
notredame.png, Paris, 2015-09-01 12:00:00
me.jpg, Warsaw, 2013-09-06 15:40:22
a.png, Warsaw, 2016-02-13 13:33:50
b.jpg, Warsaw, 2016-01-02 15:12:22
c.jpg, Warsaw, 2016-01-02 14:34:30
d.jpg, Warsaw, 2016-01-02 15:15:01
e.png, Warsaw, 2016-01-02 09:49:09
f.png, Warsaw, 2016-01-02 10:55:32
g.jpg, Warsaw, 2016-02-29 22:13:11`;

// TODO: output 
// Warsaw02.jpg
// London1.png
// Warsaw01.png
// Paris2.jpg
// Paris1.jpg
// London2.jpg
// Paris3.png
// Warsaw03.jpg
// Warsaw09.png
// Warsaw07.jpg
// Warsaw06.jpg
// Warsaw08.jpg
// Warsaw04.png
// Warsaw05.png
// Warsaw10.jpg

class PhotoFile {
  constructor(filename, i) {
    this.index = i;
    this.filename = filename;
    const fileArray = filename.split(',');
    this.photoName = fileArray[0];
    this.fileType = this.photoName.split('.')[1];
    this.cityName = fileArray[1];
    this.dateString = fileArray[2];
    this.date = new Date(this.dateString);
    this.dateSortedIndex = null;
  }

  formattedFileName() {
    return 'TODO';
  }
}

class PhotoAlbum {
  // todo: hash of cities with count for number of photos
  constructor(filenames) {
    this.filenames = filenames
    this.photoFiles = filenames.map((f,i) => {
      return new PhotoFile(f, i)
    });
  }

  sortByDate() {
    const files = this.photoFiles;
    return files.sort((a,b) => Date.parse(b.dateString) - Date.parse(a.dateString))
  }

  cities() {
    // return array of cities
    return Array.from(new Set(this.photoFiles.map((f) => f.cityName)))
  }

  formattedFilenames() {
    // create hash with index for each city
    // how to track leading 0s?

    return this.photoFiles.map((f) => {
      const index = this.sortByDate().filter(x => x.cityName === f.cityName).findIndex((photo) => photo.filename === f.filename);
      return `${f.cityName}${index}.${f.fileType}`;
    }).join('\n');
  }
}

function solution(i) {
  // split input into array of filenames
  const filenames = i.split(/\r?\n/);
  // console.log(filenames);
  const photoAlbum = new PhotoAlbum(filenames);
  // const photoFiles = filenames.map(f => new PhotoFileName(f))
  // console.log(photoFiles);
  // console.log(photoAlbum.cities());
  return photoAlbum.formattedFilenames();
}

console.log(solution(input));
