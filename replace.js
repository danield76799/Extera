import fs from 'fs';

const files = fs.readdirSync('lib/', {
    recursive: true
});

const q = process.argv[2];

var total = 0;

for (const f of files) {
    try {
        if (f.includes('lib/generated')) continue;
        const b = fs.readFileSync(`lib/${f}`, 'utf-8');
            total ++;
            fs.writeFileSync(`lib/${f}`, b.replaceAll(`package:fluffychat`, `package:extera_next`));
            console.log(f);
    } catch (error) {
        
    }
}

console.log(`${total} files in total`);