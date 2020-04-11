class DOMNodeCollection {
    constructor(HTMLeles) {
        this.eles = HTMLeles;
    }

    html(arg) {
        let newVals = [];
        if (arg) {
            for(let i = 0; i < this.eles.length; i++) {
                this.eles[i].innerText = arg;
                newVals.push(this.eles[i])
            }
        } else {
            return this.eles[0];
        }
        return newVals;
    }

    empty() {
      let emptied = []
      for (let i = 0; i < this.eles.length; i++) {
        this.eles[i].innerText = "";
        emptied.push(this.eles[i]);
      }
      return emptied;
    }
}

module.exports = DOMNodeCollection
