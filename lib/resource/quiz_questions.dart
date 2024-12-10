class Quiz{
  static const List<Map<String, dynamic>> listQuestionAnswer =
  [
    {
      //1
      'code': 'print("Hello, Python!")',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'Hello, Python!',
          'isCorrect': true
        },
        {
          'choice': 'Python!',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //2
      'code': 'nama = "Ali\n"print(nama)',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'Ali',
          'isCorrect': true
        },
        {
          'choice': 'nama',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //3
      'code': 'angka1 = 7\nangka2 = 3\nprint(angka1 + angka2)',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': '10',
          'isCorrect': true
        },
        {
          'choice': '73',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //4
      'code': 'x = 5\ny = 10\nprint(x > y)',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'True',
          'isCorrect': false
        },
        {
          'choice': 'False',
          'isCorrect': true
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //5
      'code': 'umur = 15\nif umur > 13:\n\t\tprint("Remaja")',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'Remaja',
          'isCorrect': true
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
        {
          'choice': 'Tidak ada output',
          'isCorrect': false
        },
      ],
    },
    {
      //6
      'code': 'for i in range(3):\n\t\tprint("Python")',
      'question': 'Berapa kali kata "Python" akan ditampilkan?',
      'answers':
      [
        {
          'choice': '3',
          'isCorrect': true
        },
        {
          'choice': '1',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //7
      'code': 'buah = ["apel", "jeruk", "mangga"]\nprint(buah[1])',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'apel',
          'isCorrect': false
        },
        {
          'choice': 'jeruk',
          'isCorrect': true
        },
        {
          'choice': 'mangga',
          'isCorrect': false
        },
      ],
    },
    {
      //8
      'code': 'a = 20\nb = 5\nprint(a - b * 2)',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': '30',
          'isCorrect': false
        },
        {
          'choice': '10',
          'isCorrect': true
        },
        {
          'choice': '0',
          'isCorrect': false
        },
      ],
    },
    {
      //9
      'code': 'nama = input("Masukkan nama: ")\nprint("Halo, " + nama)',
      'question': 'Jika pengguna memasukkan "Siti", apa outputnya?',
      'answers':
      [
        {
          'choice': 'Halo, nama',
          'isCorrect': false
        },
        {
          'choice': 'Halo, Siti',
          'isCorrect': true
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //10
      'code': 'def sapa():\n\t\tprint("Halo, Dunia!")\n\nsapa()',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'Halo, Dunia!',
          'isCorrect': true
        },
        {
          'choice': 'sapa',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //11
      'code': 'x = 3\nwhile x > 0:\n\t\tprint(x)\n\t\tx -= 1',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': '3,2,1',
          'isCorrect': true
        },
        {
          'choice': '3,2,1,0',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //12
      'code': 'teks = "python"\nprint(teks.upper())',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'PYTHON',
          'isCorrect': true
        },
        {
          'choice': 'python',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //13
      'code': 'umur = 18\nif umur >= 17:\n\t\tprint("Bisa membuat SIM")\nelse:\n\t\tprint("Belum bisa membuat SIM")',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'Bisa membuat SIM',
          'isCorrect': true
        },
        {
          'choice': 'Belum bisa membuat SIM',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //14
      'code': 'angka = [1, 2, 3]\nfor x in angka:\n\t\tprint(x * 2)',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': '2,4,6',
          'isCorrect': true
        },
        {
          'choice': '1,2,3',
          'isCorrect': false
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
    {
      //15
      'code': 'data = {"nama": "Budi", "umur": 16}\nprint(data["umur"])',
      'question': 'Apa outputnya?',
      'answers':
      [
        {
          'choice': 'Budi',
          'isCorrect': false
        },
        {
          'choice': '16',
          'isCorrect': true
        },
        {
          'choice': 'Error',
          'isCorrect': false
        },
      ],
    },
  ];
}