program tubes;
uses crt;
const nMax = 100;
type    D_Pemilih = record
        Nama  : string;
        NIM   : string;
        Gender: string;
        Pcalon: string;
        No    : integer;
end;
type    D_Calon = record
        Nama   : string;
        Wakil  : string;
        NIM    : string;
        Visi   : string;
        Misi   : string;
        Suara  : integer;
        Umur   : integer;
        Tinggi : integer;
        Gender : String;
        No     : integer;
end;
type    datCalon = array[1..nMax] of D_Calon;
type    datPemilih = array[1..nMax] of D_Pemilih;
var
        Pemilih         : datPemilih;
        Calon           : datCalon;
        i,a,c,d,pass,x  : longint;
        stats           : Boolean;
        temp            : D_Calon;

        procedure delCalon(var a : longint;var Calon:datCalon);
        {I.S Terdefinisi Calon dengan panjang array a
         F.S Mengembalikan Data Calon yang telah didelet salah satu indeks nya}
        var
            idx:longint;
            temp:D_Calon;
        begin
            writeln('');
            repeat
                write('Tentukan index/no urut yang ingin di delete: '); readln(idx);
            until(idx>0)and(idx<=a);
            temp:=Calon[idx];
            while (idx<=a) do
            begin
                Calon[idx+1].No:=Calon[idx+1].No-1;
                Calon[idx]:=Calon[idx+1];
                idx:=idx+1;
            end;
            Calon[a]:=temp;
            a:=a-1;
            writeln('Data telah berhasil dihapus');
            readln;
        end;

        procedure editCalon(var Calon:datCalon);
        {I.S Terdefinisi Calon
         F.S Mengembalikan Data Calon yang teah diedit}
        var
            idx:longint;
            pil:string;
        begin
            writeln('');
            repeat
                write('Tentukan index/no urut yang ingin di edit: '); readln(idx);
            until(idx>0)and(idx<=a);
            repeat
            clrscr;
            writeln('================================');
            writeln('=     Edit Calon Ke ',idx,'    =');
            writeln('================================');
            writeln('=1.   Edit Nama                =');
            writeln('=2.   Edit Nama Wakil          =');
            writeln('=3.   Edit NIM                 =');
            writeln('=4.   Edit Visi                =');
            writeln('=5.   Edit Misi                =');
            writeln('=6.   Edit Umur                =');
            writeln('=7.   Edit Tinggi              =');
            writeln('=8.   Kembali                  =');
            writeln('================================');
            write('= Pilihan: '); readln(pil);
            writeln('');
            case pil of
                '1' : begin writeln('Nama       : ',Calon[idx].Nama);
                      write('Edit       : '); readln(Calon[idx].Nama); 
                      writeln('Data Telah Berhasil diedit'); readln; end;
                '2' : begin writeln('Wakil      : ',Calon[idx].Wakil);
                      write('Edit       : '); readln(Calon[idx].Wakil); 
                      writeln('Data Telah Berhasil diedit'); readln; end;
                '3' : begin writeln('NIM        : ',Calon[idx].NIM);
                      write('Edit       : '); readln(Calon[idx].NIM); 
                      writeln('Data Telah Berhasil diedit'); readln; end;
                '4' : begin writeln('Visi       : ',Calon[idx].Visi);
                      write('Edit       : '); readln(Calon[idx].Visi);
                      writeln('Data Telah Berhasil diedit'); readln; end;
                '5' : begin writeln('Misi       : ',Calon[idx].Misi);
                      write('Edit       : '); readln(Calon[idx].Misi); 
                      writeln('Data Telah Berhasil diedit'); readln; end;
                '6' : begin writeln('Umur       : ',Calon[idx].Umur);
                      write('Edit       : '); readln(Calon[idx].Umur); 
                      writeln('Data Telah Berhasil diedit'); readln; end;
                '7' : begin writeln('Tinggi     : ',Calon[idx].Tinggi);
                      write('Edit       : '); readln(Calon[idx].Tinggi); 
                      writeln('Data Telah Berhasil diedit'); readln; end;
            end;
            until(pil='8');
        end;

        procedure delPemilih(var i : longint;var Pemilih:datPemilih;var Calon:datCalon;a:longint);
        {I.S Terdefinisi Pemilih dengan panjang array i
         F.S Mengembalikan Data Pemilih yang telah didelet salah satu indeks nya}
        var
            idx,x,t:longint;
            temp:D_Pemilih;
        begin
            writeln('');
            repeat
                write('Tentukan index/no urut yang ingin di delete: '); readln(idx);
            until(idx>0)and(idx<=i);
            t:=idx;
            temp:=Pemilih[idx];
            while (idx<=i) do
            begin
                Pemilih[idx+1].No:=Pemilih[idx+1].No-1;
                Pemilih[idx]:=Pemilih[idx+1];
                idx:=idx+1;
            end;
            Pemilih[i]:=temp;
            i:=i-1;
            for x:=1 to a do begin
                if Pemilih[t].Pcalon=Calon[x].Nama then begin
                    Calon[x].Suara:=Calon[x].Suara-1;
                end;
            end;
            writeln('Data telah berhasil dihapus');
            readln;
        end;

        procedure editPemilih(var Pemilih:datPemilih);
        {I.S Terdefinisi Pemilih
         F.S Mengembalikan Data Pemilih yang telah diedit}
        var
            idx:longint;
            pil:string;
        begin
            writeln('');
            repeat
                write('Tentukan index/no urut yang ingin di edit: '); readln(idx);
            until(idx>0)and(idx<=i);
            repeat
                clrscr;
                writeln('================================');
                writeln('=    Edit Pemilih Ke ',idx,'   =');
                writeln('================================');
                writeln('=1.   Edit Nama                =');
                writeln('=2.   Edit NIM                 =');
                writeln('=3.   Kembali                  =');
                writeln('================================');
                write('= Pilihan: '); readln(pil);
                writeln('');
                case pil of 
                    '1' : begin writeln('Nama       : ',Pemilih[idx].Nama);
                          write('Edit       : '); readln(Pemilih[idx].Nama); 
                          writeln('Data Telah Berhasil diedit'); readln; end;
                    '2' : begin writeln('NIM        : ',Pemilih[idx].NIM);
                          write('Edit       : '); readln(Pemilih[idx].NIM); 
                          writeln('Data Telah Berhasil diedit'); readln; end;
                end;
            until(pil='3');
        end;

        procedure buatCalon(var a:longint);
        {I.S Terdefinisi a adalah long integer
         F.S Mengembaikan Data Calon ke a yang telah terisi}
        begin
                clrscr;
                writeln('* Menu >> Admin >> Buat Data Calon Ketua BEM');
                writeln('============================================');
                writeln('Masukkan Data Calon Ketua BEM');
                Calon[a].No:=a;
                write('= Nama        : '); readln(Calon[a].Nama);
                write('= Wakil       : '); readln(Calon[a].Wakil);
                write('= NIM         : '); readln(Calon[a].NIM);
                write('= Umur        : '); readln(Calon[a].Umur);
                write('= Tinggi      : '); readln(Calon[a].Tinggi);
                repeat
                    write('= Gender[L/P] : '); readln(Calon[a].Gender);
                until(Calon[a].Gender='L')or(Calon[a].Gender='P');
                write('= Visi        : '); readln(Calon[a].Visi);
                write('= Misi        : '); readln(Calon[a].Misi);
                Calon[a].Suara:=0;
                write('Data telah tersimpan, klik Enter...');
                readln;
        end;

        procedure dataCalon(var a:longint);
        {I.S
         F.S Menampilkan Data Calon}
        var
            pil: string;
        begin
                repeat
                    clrscr;
                    c:=1;
                    writeln('* Menu >> Admin >> Data Calon Ketua BEM');
                    writeln('=======================================');
                    writeln('Data Calon Ketua BEM yang Telah Mendaftar: ');
                    while c<=a do begin
                        writeln('= No Urut  : ',Calon[c].No);
                        writeln('= Nama     : ',Calon[c].Nama);
                        writeln('= Wakil    : ',Calon[c].Wakil);
                        writeln('= NIM      : ',Calon[c].NIM);
                        writeln('= Umur     : ',Calon[c].Umur,' Tahun');
                        writeln('= Tinggi   : ',Calon[c].Tinggi,' cm');
                        writeln('= Gender   : ',Calon[c].Gender);
                        writeln('= Visi     : ',Calon[c].Visi);
                        writeln('= Misi     : ',Calon[c].Misi);
                        writeln('= Suara    : ',Calon[c].Suara);
                        writeln(' ');
                        if (c mod 2 = 0) then
                            begin
                                readln;
                            end;
                        c:=c+1;
                    end;
                    write('[1]Delete [2]Edit [3]Back : '); readln(pil);
                    if a>0 then begin
                        case pil of
                        '1' : delCalon(a,Calon);
                        '2' : editCalon(Calon);
                        end;
                    end;
                until(pil='3');
        end;

        procedure resetCalon(var a:longint);
        {I.S Terdefinisi a longint
         F.S Mengembalikan a yang telah diset menjadi 0}
        var
            pil: string;
        begin
            writeln('');
            repeat
                write('Apakah yakin anda ingin me-reset Data Calon Ketua?[Y/T] : '); readln(pil);
            until(pil='Y')or(pil='y')or(pil='T')or(pil='t');
            if (pil='Y')or(pil='y') then
                a:=0;
        end;


        procedure dataPemilih(var i:longint);
        {I.S 
         F.S Menampilkan Data Pemilih}
        var
            pil: string;
        begin
                repeat
                    clrscr;
                    c:=1;
                    writeln('* Menu >> Admin >> Data Pemilih');
                    writeln('===================================');
                    writeln('Data Mahasiswa yang Telah Memilih: ');
                    while c<=i do begin
                        writeln('= No            : ',Pemilih[c].No);
                        writeln('= Nama          : ',Pemilih[c].Nama);
                        writeln('= NIM           : ',Pemilih[c].NIM);
                        writeln('= Gender[L/P]   : ',Pemilih[c].Gender);
                        writeln('= Calon dipilih : ',Pemilih[c].Pcalon);
                        writeln(' ');
                        if (c mod 4=0) then begin
                            readln;
                        end;
                        c:=c+1;
                    end;
                    write('[1]Delete [2]Edit [3]Back : '); readln(pil);
                    if i>0 then begin
                        case pil of
                            '1' : delPemilih(i,Pemilih,Calon,a);
                            '2' : editPemilih(Pemilih);
                        end;
                    end;
                until(pil='3');
        end;

        procedure resetPemilih(var i :longint;var Calon:datCalon; a:longint);
        {I.S Terdefinisi i adalah long integer
         F.S Mengembalikan i yang telah diset menjadi 0 dan meng-set suara calon menjadi 0 }
        var
            x: longint;
            pil: string;
        begin
            writeln('');
            repeat
                write('Apakah yakin anda ingin me-reset Data Pemilih?[Y/T] : '); readln(pil);
            until(pil='Y')or(pil='y')or(pil='T')or(pil='t');
            if (pil='Y')or(pil='y') then begin
                i:=0;
                for x:=1 to a do begin
                    Calon[x].Suara:=0;
                end;
            end;
        end;

       procedure urutSuara(a:longint;Calon:datCalon);
       {I.S Terdefinisi Calon dengan panjang array a
        F.S Menampilkan Data Calon yang telah terurut berdasarkan Suara dengan Bubble Sort secara Descending}
        var
            x,pass:longint;
            temp:D_Calon;
        begin
            clrscr;
            writeln('* Menu >> Admin >> Peringkat Calon Ketua BEM >> Suara Terbanyak');
            writeln('===============================================================');
            writeln('=                  Berdasarkan Suara Terbanyak                =');
            writeln('===============================================================');
            {BUBBLE SORT}
            pass:=1;
            while pass<=a-1 do begin
                x:=1;
                while x<=a-pass do begin
                    if Calon[x].Suara<Calon[x+1].Suara then begin
                        temp:=Calon[x];
                        Calon[x]:=Calon[x+1];
                        Calon[x+1]:=temp;
                    end;
                    x:=x+1;
                end;
                pass:=pass+1;
            end;
            for d:=1 to a do begin
                writeln('= No       : ',d);
                writeln('= No Urut  : ',Calon[d].No);
                writeln('= Nama     : ',Calon[d].Nama);
                writeln('= Wakil    : ',Calon[d].Wakil);
                writeln('= NIM      : ',Calon[d].NIM);
                writeln('= Umur     : ',Calon[d].Umur,' Tahun');
                writeln('= Tinggi   : ',Calon[d].Tinggi,' cm');
                writeln('= Gender   : ',Calon[d].Gender);
                writeln('= Visi     : ',Calon[d].Visi);
                writeln('= Misi     : ',Calon[d].Misi);
                writeln('= Suara    : ',Calon[d].Suara);
                writeln(' ');
                if (d mod 2 = 0) then
                begin
                    readln;
                end;
            end;
            readln;
        end;

        procedure umurTermuda(a:longint;Calon:datCalon);
        {I.S Terdefinisi Calon dengan panjang array a
         F.S Menampilkan Data Calon yang telah terurut berdasarkan Umur dengan Selection Sort secara Ascending}
        var
            x,pass,i_min:longint;
            temp:D_Calon;
        begin
            clrscr;
            writeln('* Menu >> Admin >> Peringkat Calon Ketua BEM >> Umur Termuda ke Tua');
            writeln('===================================================================');
            writeln('=                  Berdasarkan Umur Termuda ke Tua                =');
            writeln('===================================================================');
            {SELECTION SORT}
            pass:=1;
            while pass<=a-1 do
            begin
                i_min:=pass;
                x:=pass+1;
                while x<=a do
                begin
                    if Calon[i_min].Umur>Calon[x].Umur then
                        i_min:=x;
                    x:=x+1;
                end;
                temp:=Calon[i_min];
                Calon[i_min]:=Calon[pass];
                Calon[pass]:=temp;
                pass:=pass+1;
            end;
            for d:=1 to a do begin
                writeln('= No       : ',d);
                writeln('= No Urut  : ',Calon[d].No);
                writeln('= Nama     : ',Calon[d].Nama);
                writeln('= Wakil    : ',Calon[d].Wakil);
                writeln('= NIM      : ',Calon[d].NIM);
                writeln('= Umur     : ',Calon[d].Umur,' Tahun');
                writeln('= Tinggi   : ',Calon[d].Tinggi,' cm');
                writeln('= Gender   : ',Calon[d].Gender);
                writeln('= Visi     : ',Calon[d].Visi);
                writeln('= Misi     : ',Calon[d].Misi);
                writeln('= Suara    : ',Calon[d].Suara);
                writeln(' ');
                if (d mod 2 = 0) then
                begin
                    readln;
                end;
            end;
            readln;
        end;

        procedure tinggiBadan(a:longint;Calon:datCalon);
        {I.S Terdefinisi Calon dengan panjang array a
         F.S Menampilkan Data Calon yang telah terurut berdasarkan Tinggi Badan dengan Insertion Sort secara Ascending}
        var
            x,pass:longint;
            temp:D_Calon;
        begin
            clrscr;
            writeln('* Menu >> Admin >> Peringkat Calon Ketua BEM >> Tinggi Badan ');
            writeln('=============================================================');
            writeln('=                   Berdasarkan Tinggi Badan                =');
            writeln('=============================================================');
            {INSERTION SORT}
            pass:=1;
            while pass<=a-1 do
            begin
                x:=pass+1;
                temp:=Calon[x];
                while (temp.Tinggi<Calon[x-1].Tinggi) and (x>1) do
                begin
                    Calon[x]:=Calon[x-1];
                    x:=x-1;
                end;
                Calon[x]:=temp;
                pass:=pass+1;
            end;
            for d:=1 to a do begin
                writeln('= No       : ',d);
                writeln('= No Urut  : ',Calon[d].No);
                writeln('= Nama     : ',Calon[d].Nama);
                writeln('= Wakil    : ',Calon[d].Wakil);
                writeln('= NIM      : ',Calon[d].NIM);
                writeln('= Umur     : ',Calon[d].Umur,' Tahun');
                writeln('= Tinggi   : ',Calon[d].Tinggi,' cm');
                writeln('= Gender   : ',Calon[d].Gender);
                writeln('= Visi     : ',Calon[d].Visi);
                writeln('= Misi     : ',Calon[d].Misi);
                writeln('= Suara    : ',Calon[d].Suara);
                writeln(' ');
                if (d mod 2 = 0) then
                begin
                    readln;
                end;
            end;
            readln;
        end;


        procedure peringkatCalon(a:longint;Calon:datCalon);
        {I.S
         F.S}
        var
            pil:string;
        begin
            repeat
                clrscr;
                writeln('* Menu >> Admin >> Peringkat Calon Ketua BEM');
                writeln('============================================');
                writeln('=      Peringkat Calon Ketua BEM Tel-U     =');
                writeln('============================================');
                writeln('=1. Suara Terbanyak                        =');
                writeln('=2. Umur Termuda ke Tua                    =');
                writeln('=3. Tinggi Badan                           =');
                writeln('=4. Kembali                                =');
                writeln('============================================');
                write('= Pilihan: '); readln(pil);
                case pil of
                    '1' : urutSuara(a,Calon);
                    '2' : umurTermuda(a,Calon);
                    '3' : tinggiBadan(a,Calon);
                end;
            until(pil = '4');
        end;

        function statusAcara(pil:string):Boolean;
        {I.S Terdefinisi pil string
         F.S Mengembalikan boolean}
        begin
            case pil of
                '1' : statusAcara:=True;
                '2' : statusAcara:=False;
            end;
         end;

        procedure acara();
        {I.S -
         F.S Mengembalikan stats menjadi TRUE atau FALSE}
        var
            pil:string;
        begin
            clrscr;
            writeln('* Menu >> Admin >> Acara');
            writeln('========================');
            writeln('=1.   Dibuka           =');
            writeln('=2.   Ditutup          =');
            writeln('========================');
            write('= Pilihan: '); readln(pil);
            stats:=statusAcara(pil);
        end;

        procedure admin();
        {I.S
         F.S}
        var
                pil:string;
        begin
                repeat
                        clrscr;
                        writeln('* Menu >> Admin');
                        writeln('==================================');
                        writeln('=1.  Acara                       =');
                        writeln('=2.  Buat Data Calon Ketua BEM   =');
                        writeln('=3.  Data Calon Ketua BEM        =');
                        writeln('=4.  Data Pemilih                =');
                        writeln('=5.  Reset Data Calon Ketua BEM  =');
                        writeln('=6.  Reset Data Pemilih          =');
                        writeln('=7.  Peringkat Calon Ketua BEM   =');
                        writeln('=8.  Kembali                     =');
                        writeln('=================================');
                        write('= Pilihan: '); readln(pil);
                        case pil of
                                '1' : acara();
                                '2' : begin inc(a); buatCalon(a); end;
                                '3' : dataCalon(a);
                                '4' : dataPemilih(i);
                                '5' : resetCalon(a);
                                '6' : resetPemilih(i,Calon,a);
                                '7' : peringkatCalon(a,Calon);
                        end;
                until(pil='8');
        end;

        procedure searchCalon(a:longint;Calon:datCalon);
        {I.S Terdefinisi Calon dengan panjang array a
         F.S Menampilkan Data yang dicari}
        var
            x, posisi:longint;
            N:string;
            status:Boolean;
        begin
            clrscr;
            writeln('* Menu >> Searching >> Calon ');
            writeln('=============================');
            writeln('=      Berdasarkan NIM      =');
            writeln('=============================');
            write('= NIM yang ingin dicari: '); readln(N);
            posisi:=0;
            x:=1;
            status:=False;
            while x<=a do begin
                if N=Calon[x].NIM then begin
                        status:=True;
                        posisi:=x;
                end;
                x:=x+1;
            end;
            if status=True then begin 
                writeln('');
                writeln('Data ditemukan');
                writeln('= No Urut  : ',Calon[posisi].No);
                writeln('= Nama     : ',Calon[posisi].Nama);
                writeln('= Wakil    : ',Calon[posisi].Wakil);
                writeln('= NIM      : ',Calon[posisi].NIM);
                writeln('= Umur     : ',Calon[posisi].Umur,' Tahun');
                writeln('= Tinggi   : ',Calon[posisi].Tinggi,' cm');
                writeln('= Gender   : ',Calon[posisi].Gender);
                writeln('= Visi     : ',Calon[posisi].Visi);
                writeln('= Misi     : ',Calon[posisi].Misi);
                writeln('= Suara    : ',Calon[posisi].Suara);
            end
            else begin
                writeln('Data tidak ditemukan');
            end;
            readln;
        end;

        procedure searchPemilih(i:longint;Pemilih:datPemilih);
        {I.S Terdefinisi Pemilih dengan panjang array i
         F.S Menampilkan Data yang dicari}
        var
            x, posisi:longint;
            N:string;
            status:Boolean;
        begin
            clrscr;
            writeln('* Menu >> Searching >> Pemilih');
            writeln('==============================');
            writeln('=     Berdasarkan Nama       =');
            writeln('==============================');
            write('= Nama yang ingin dicari: '); readln(N);
            posisi:=0;
            x:=1;
            status:=False;
            while x<=i do begin
                if N=Pemilih[x].Nama then begin
                        status:=True;
                        posisi:=x;
                end;
                x:=x+1;
            end;
            if status=True then begin
                writeln('');
                writeln('Data ditemukan');
                writeln('= No            : ',Pemilih[posisi].No);
                writeln('= Nama          : ',Pemilih[posisi].Nama);
                writeln('= NIM           : ',Pemilih[posisi].NIM);
                writeln('= Gender[L/P]   : ',Pemilih[posisi].Gender);
                writeln('= Calon dipilih : ',Pemilih[posisi].Pcalon);
            end
            else begin
                writeln('Data tidak ditemukan');
            end; 
            readln;               
        end;

        procedure search();
        {I.S
         F.S}
        var
            pil:string;
        begin
            repeat
                clrscr;
                writeln('* Menu >> Searching ');
                writeln('=============================');
                writeln('=1.   Calon                 =');
                writeln('=2.   Pemilih               =');
                writeln('=3.   Kembali               =');
                writeln('=============================');
                write('= Pilihan: '); readln(pil);
                case pil of
                    '1' : searchCalon(a,Calon);
                    '2' : searchPemilih(i,Pemilih);
                end;
            until(pil='3');
        end;

        procedure votCalon(a:longint;var Calon:datCalon);
        {I.S Terdefinisi Calon dengan panjang array a
         F.S Mengembalikkan Pemilih ke i Pcalon dan Calon ke pil Suara yang terisi}
        var
            pil,x:integer;
        begin
            clrscr;
            writeln('===============================');
            writeln('=         Daftar Calon        =');
            writeln('===============================');
            for x:=1 to a do begin
                writeln('= No Urut  : ',Calon[x].No);
                writeln('= Nama     : ',Calon[x].Nama);
                writeln('= Wakil    : ',Calon[x].Wakil);
                writeln('= Visi     : ',Calon[x].Visi);
                writeln('= Misi     : ',Calon[x].Misi);
                writeln('');
                if (x mod 4 = 0) then
                begin
                    readln;
                end;
            end;
            writeln('===============================');
            repeat
                write('= Pilih No. urut calon yang akan dipilih: '); readln(pil);
            until(pil>0)and(pil<=a);
            Pemilih[i].Pcalon:=Calon[pil].Nama;
            Calon[pil].Suara:=Calon[pil].Suara+1;
            writeln('Terima Kasih Telah Memilih...');
            readln;
        end;

        procedure mPemilih(a:longint;var Calon:datCalon);
        {I.S Terdefinisi Calon dengan panjang array a
         F.S Mengembalikan Pemilih ke i yang telah terisi}
        var
            T:Boolean;
        begin
                clrscr;
                if stats=True then begin
                    i:=i+1;
                    writeln('* Menu >> Pemilih');
                    writeln('=============================================');
                    writeln('= Selamat Datang, silakan isi form berikut: =');
                    Pemilih[i].No := i;
                    write('= Nama       : '); readln(Pemilih[i].Nama);
                    write('= NIM        : '); readln(Pemilih[i].NIM);
                    repeat
                            write('= Gender[L/P]: '); readln(Pemilih[i].Gender);
                    until(Pemilih[i].Gender = 'L')or(Pemilih[i].Gender = 'P');
                    T:=True;
                    for d:=2 to i do begin
                        if (Pemilih[i].NIM = Pemilih[d-1].NIM)and(i<>1) then
                            T:=False;
                    end;
                    if (T=True)and(a>0) then begin
                        write('User terdaftar, silakan klik Enter untuk melanjutkan...'); readln;
                        clrscr;
                        votCalon(a,Calon);
                    end
                    else if (T=True)and(a=0) then begin
                        writeln('Maaf Pemilihan Belum Bisa Dilaksanakan, Karena Belum Ada Calon yang Mendaftar');
                        i:=i-1;
                    end
                    else if (T=False) then begin
                        writeln('User sudah pernah memilih, silakan klik Enter untuk Kembali ke Menu Utama');
                        i:=i-1;
                    end;
                end
                else begin
                    writeln('* Menu >> Pemilih');
                    writeln('=============================================');
                    writeln('Waktu Pemilihan Belum Dibuka');
                end;
                readln;
        end;

        procedure menu();
        {I.S
         F.S}
        var
                pil:string;
        begin
                repeat
                        clrscr;
                        writeln('* Menu');
                        writeln('================================');
                        if (stats=False)and(i>0)and(a>0)then begin
                            pass:=1;
                            while pass<=a-1 do begin
                                x:=1;
                                while x<=a-pass do begin
                                    if Calon[x].Suara<Calon[x+1].Suara then begin
                                    temp:=Calon[x];
                                    Calon[x]:=Calon[x+1];
                                    Calon[x+1]:=temp;
                                    end;
                                    x:=x+1;
                                end;
                            pass:=pass+1;
                            end;
                            writeln('= SELAMAT KEPADA NO URUT ',Calon[1].No);
                            writeln('= KETUA : ',Calon[1].Nama);
                            writeln('= WAKIL : ',Calon[1].Wakil);
                            writeln('= TELAH TERPILIH MENJADI KETUA ');
                            writeln('= DAN WAKIL KETUA BEM TEL-U   ');
                            writeln('= DENGAN TOTAL SUARA : ',Calon[1].Suara);
                            writeln('================================');
                        end;
                        writeln('=1.  Admin                     =');
                        writeln('=2.  Pemilih                   =');
                        writeln('=3.  Searching                 =');
                        writeln('=4.  Exit                      =');
                        writeln('================================');
                        write('= Pilihan: '); readln(pil);
                        case pil of
                                '1' : admin();
                                '2' : mPemilih(a,Calon);
                                '3' : search();
                        end;
                until(pil='4');
        end;
{Program Utama}
begin
        a:=0;
        i:=0;
        clrscr;
        writeln('========================================================');
        writeln('=================== Selamat Datang =====================');
        writeln('========== Aplikasi Pemilihan Ketua BEM Tel-U ==========');
        writeln('========================================================');
        write('Untuk lanjut ke Menu Utama, Klik Enter....'); readln;
        stats:=False;
        menu();
end.