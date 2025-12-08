const hre = require("hardhat");

async function main() {
    //
    const contractAddress = "masukkan alamat kontrak hasil deploy Anda di sini";

    const Belajar = await hre.ethers.getContractAt("Belajar", contractAddress);

    console.log("=== Debug Mode ===");

    const pemilik = await Belajar.getPemilik();
    console.log("🚀 ~ main ~ pemilik:", pemilik);

    const textRaw = await Belajar.textRaw();
    console.log("🚀 ~ main ~ textRaw:", textRaw);

    console.log("== update textRaw ==");
    const setTextRaw = await Belajar.setText("Writer text...");
    await setTextRaw.wait();

    const getTextRaw = await Belajar.textRaw();
    console.log("🚀 ~ main ~ getTextRaw:", getTextRaw);

    const getNumber = await Belajar.angka();
    console.log("🚀 ~ main ~ getNumber:", getNumber);

    console.log("== update angka ==");

    const setNumber = await Belajar.inc();
    await setNumber.wait();

    const getNewNumber = await Belajar.angka();
    console.log("🚀 ~ main ~ getNewNumber:", getNewNumber);
}

main().catch((err) => {
    console.log(err);

    process.exit(1);
});
