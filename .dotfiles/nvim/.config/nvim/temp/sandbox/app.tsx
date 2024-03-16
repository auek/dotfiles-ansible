const promise = new Promise((res) => {
  setTimeout(() => {
    res("done");
  }, 3000);
});
