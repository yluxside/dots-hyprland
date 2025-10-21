.pragma library

const chords = [
    {
        name: 'C',
        startFret: 1,
        frets: [ -1, 3, 2, 0, 1, 0 ],
        fingers: [ { f: 3, s: 5, p: 3 }, { f: 2, s: 4, p: 2 }, { f: 1, s: 2, p: 1 } ],
        rootString: 5
    },
    {
        name: 'D',
        startFret: 1,
        frets: [ -1, -1, 0, 2, 3, 2 ],
        fingers: [ { f: 1, s: 3, p: 2 }, { f: 3, s: 2, p: 3 }, { f: 2, s: 1, p: 2 } ],
        rootString: 4
    },
    {
        name: 'E',
        startFret: 1,
        frets: [ 0, 2, 2, 1, 0, 0 ],
        fingers: [ { f: 2, s: 5, p: 2 }, { f: 3, s: 4, p: 2 }, { f: 1, s: 3, p: 1 } ],
        rootString: 6
    },
    {
        name: 'F',
        startFret: 1,
        barre: { fret: 1, from: 6, to: 1 },
        frets: [ 1, 3, 3, 2, 1, 1 ],
        fingers: [ { f: 3, s: 5, p: 3 }, { f: 4, s: 4, p: 3 }, { f: 2, s: 3, p: 2 } ],
        rootString: 6
    },
    {
        name: 'G',
        startFret: 1,
        frets: [ 3, 2, 0, 0, 0, 3 ],
        fingers: [ { f: 2, s: 6, p: 3 }, { f: 1, s: 5, p: 2 }, { f: 4, s: 1, p: 3 } ],
        rootString: 6
    },
    {
        name: 'A',
        startFret: 1,
        frets: [ -1, 0, 2, 2, 2, 0 ],
        fingers: [ { f: 1, s: 4, p: 2 }, { f: 2, s: 3, p: 2 }, { f: 3, s: 2, p: 2 } ],
        rootString: 5
    },
    {
        name: 'B',
        startFret: 2,
        barre: { fret: 2, from: 5, to: 1 },
        frets: [ -1, 2, 4, 4, 4, 2 ],
        fingers: [ { f: 2, s: 4, p: 4 }, { f: 3, s: 3, p: 4 }, { f: 4, s: 2, p: 4 } ],
        rootString: 5
    },
    {
        name: 'Cm',
        startFret: 3,
        barre: { fret: 3, from: 5, to: 1 },
        frets: [ -1, 3, 5, 5, 4, 3 ],
        fingers: [ { f: 3, s: 4, p: 5 }, { f: 4, s: 3, p: 5 }, { f: 2, s: 2, p: 4 } ],
        rootString: 5
    },
    {
        name: 'Dm',
        startFret: 1,
        frets: [ -1, -1, 0, 2, 3, 1 ],
        fingers: [ { f: 2, s: 3, p: 2 }, { f: 3, s: 2, p: 3 }, { f: 1, s: 1, p: 1 } ],
        rootString: 4
    },
    {
        name: 'Em',
        startFret: 1,
        frets: [ 0, 2, 2, 0, 0, 0 ],
        fingers: [ { f: 2, s: 5, p: 2 }, { f: 3, s: 4, p: 2 } ],
        rootString: 6
    },
    {
        name: 'Fm',
        startFret: 1,
        barre: { fret: 1, from: 6, to: 1 },
        frets: [ 1, 3, 3, 1, 1, 1 ],
        fingers: [ { f: 3, s: 5, p: 3 }, { f: 4, s: 4, p: 3 } ],
        rootString: 6
    },
    {
        name: 'Gm',
        startFret: 3,
        barre: { fret: 3, from: 6, to: 1 },
        frets: [ 3, 5, 5, 3, 3, 3 ],
        fingers: [ { f: 3, s: 5, p: 5 }, { f: 4, s: 4, p: 5 } ],
        rootString: 6
    },
    {
        name: 'Am',
        startFret: 1,
        frets: [ -1, 0, 2, 2, 1, 0 ],
        fingers: [ { f: 2, s: 4, p: 2 }, { f: 3, s: 3, p: 2 }, { f: 1, s: 2, p: 1 } ],
        rootString: 5
    },
    {
        name: 'Bm',
        startFret: 2,
        barre: { fret: 2, from: 5, to: 1 },
        frets: [ -1, 2, 4, 4, 3, 2 ],
        fingers: [ { f: 3, s: 4, p: 4 }, { f: 4, s: 3, p: 4 }, { f: 2, s: 2, p: 3 } ],
        rootString: 5
    },

];
