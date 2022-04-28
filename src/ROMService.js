class ROMService
{
  constructor()
  {
    this.rom = null;
    this.generatedROM = null;
    this.romReady = false;
  }

  applyOverwritePatch = (patch) =>
  {
    let fileBytes = this.generatedROM[patch.filename];

    if(fileBytes)
    {
      let isHex = patch.byteFormat === "hex";

      Object.keys(patch.data).forEach((dataKey) => 
      {
        let index = parseInt(dataKey);

        if(!isNaN(index))
        {
          let nbs = patch.data[dataKey];

          for(let i = 0; i < nbs.length; i++)
            fileBytes[index + i] = isHex ? parseInt(nbs[i], 16) : nbs[i];
        }
      });
    }
  }

  applyPatch = (patch) =>
  {
    if(patch.type === "build")
      this.applyBuildPatch(patch);
    else if(patch.type === "overwrite")
      this.applyOverwritePatch(patch);
  }

  applyPatches = (patches) =>
  {
    Object.keys(patches).forEach((field) =>
    {
      this.applyPatch(patches[field]);
    });
  }

  convertHexArrayToByteArray = (hexArray) =>
  {
    let byteArray = new Array();

    for(let i = 0; i < hexArray.length; i++)
      byteArray.push(parseInt(hexArray[i], 16));

    return byteArray;
  }

  convertNumberToROMBytes = (number, byteAmount) =>
  {
    let bytes = new Array();
    let hex = (number >>> 0).toString(16);

    if(number > -1)
    {
      hex = "0".repeat((2 * byteAmount) - hex.length) + hex;
      
      for(let i = 0; i < byteAmount; i++)
        bytes[i] = hex.slice(i * 2, (i + 1) * 2);
      
      bytes.reverse();
    }
    else
    {
      let startIndex = hex.length - (byteAmount * 2);
      let hexChars = hex.substring(startIndex, hex.length);

      for(let i = 0; i < byteAmount; i++)
      {
        let index = i * 2;
        bytes[i] = hexChars[index] + hexChars[index + 1];
      }
    }

    return bytes;
  }

  convertStringToROMBytes = (text) =>
  {
    let bytes = [];

    for(let i = 0; i < text.length - 1; i += 2)
    {
      bytes.push(text.charCodeAt(i + 1).toString(16));
      bytes.push(text.charCodeAt(i).toString(16));
    }

    return bytes;
  }

  cloneROM = () =>
  {
    this.generatedROM = {};
    Object.keys(this.rom).forEach((e) =>
    {
      this.generatedROM[e] = this.rom[e].slice();
    });
    this.mergeFiles();
  }
  
  setROM = (rom) =>
  {
    this.rom = rom;
  }

  getGeneratedROM = () =>
  {
    return this.generatedROM;
  }

  getBytesAsDecimal = (bytes, byteFormat) =>
  {
    return byteFormat === "hex" ?
        this.convertHexArrayToByteArray(bytes) : bytes;
  }

  setByte = (filename, byteIndex, value) =>
  {
    let fileBytes = this.generatedROM[filename];

    if(fileBytes && !isNaN(value) && value > -1 && value < 256)
      fileBytes[byteIndex] = value;
  }

  setHexByte = (filename, byteIndex, value) =>
  {
    let fix = parseInt(value, 16);
    this.setByte(filename, byteIndex, fix);
  }

  setBytes = (filename, byteIndex, bytes, byteFormat) =>
  {
    if(byteIndex > -1)
    {
      let fbs = this.getBytesAsDecimal(bytes, byteFormat);
      let fileBytes = this.generatedROM[filename];
      fbs.forEach((byte, index) => fileBytes[byteIndex + index] = byte);
    }
  }

  getByte = (filename, byteIndex) =>
  {
    return this.getFileBytes(filename)[byteIndex];
  }

  getBytes = (filename, byteIndex, amount) =>
  {
    return this.getFileBytes(filename).slice(byteIndex, byteIndex + amount);
  }

  indexOfBytes = (filename, bytes, byteFormat, startIndex) =>
  {
    let fileBytes = this.generatedROM[filename];

    if(fileBytes)
    {
      let fbs = this.getBytesAsDecimal(bytes, byteFormat);
      let checkBytes = (element, index, romBytes) =>
      {
        for(let i = 0; i < fbs.length; i++)
        {
          if(fbs[i] !== romBytes[index + i])
            return false;
        }
        
        return true;
      };
      return fileBytes.findIndex(checkBytes, startIndex);
    }

    return -1;
  }

  mergeFiles = () =>
  {
    let file23 = this.removeCPUFile(23);
    let file22 = this.removeCPUFile(22);
    let file21 = this.removeCPUFile(21);
    let length = 524288;

    if(file23 && file22 && file21)
    {
      this.generatedROM["cde_re.10f"] = [].concat(file23).concat(file22).
          concat(file21).concat(Array(length).fill(0));
    }
    else
      throw new Error("The ROM has problems with one of the 3 main CPU files!");
  }

  removeCPUFile = (id) =>
  {
    let cpuFile;
    let names =
    [
      "cde_" + id + "a.rom",
      "cde_" + id + "a.bin",
      "cde_" + id + "a." + (6 + (id - 21)) + "f"
    ];
    names.forEach((name) => 
    {
      cpuFile = cpuFile ? cpuFile : this.generatedROM[name];
      delete this.generatedROM[name];
    });

    return (cpuFile && cpuFile.length === 524288) ? cpuFile : null;
  }

  getFileBytes = (filename) =>
  {
    let gr = this.generatedROM ? this.generatedROM : {};
    let fileBytes = gr[filename];
    return fileBytes ? fileBytes : [];
  }
}


let romService = new ROMService();