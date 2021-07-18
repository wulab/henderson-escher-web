window.viewports = [];

function openViewport(name, width, height) {
  var canvas = document.createElement('canvas');
  var figure = document.createElement('figure');
  var figcaption = document.createElement('figcaption');

  figure.append(canvas);
  figure.append(figcaption);
  figcaption.textContent = name;
  canvas.width = width;
  canvas.height = height;

  if (window.viewports.length > 0) {
    window.viewports[window.viewports.length - 1].after(figure);
  } else {
    document.body.prepend(figure);
  }

  window.viewports.push(figure);

  return figure;
}

function drawLine(viewport, x0, y0, x1, y1) {
  var canvas = viewport.firstElementChild;
  var ctx = canvas.getContext('2d');

  ctx.beginPath();
  ctx.moveTo(x0, y0);
  ctx.lineTo(x1, y1);
  ctx.stroke();
}

function drawString(viewport, text, x, y) {
  var canvas = viewport.firstElementChild;
  var ctx = canvas.getContext('2d');

  ctx.fillText(text, x, y);
}
