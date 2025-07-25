// https://github.com/DeMoorJasper/parcel-plugin-imagemin
module.exports = {
  gifsicle: { optimizationLevel: 2, interlaced: false, colors: 10 },
  mozjpeg: { progressive: true, quality: 8 },
  pngquant: { quality: [0.25, 0.5] },
  svgo: {
    plugins: [{ removeViewBox: false }, { cleanupIDs: true }]
  },
  webp: { quality: 8 }
}; 