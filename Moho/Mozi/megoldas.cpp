#include <fstream>
#include <set>
#include <vector>

using namespace std;

int n, m;
set<int> igenyek[301];  // egy ulesre leadott igenyek halmaza
int szek[1001][2];  // egy igenyben levo ket szek sorszama
vector<pair<int, int> > kiosztas;

int masikszek(int i, int sz) {
    return szek[i][0] == sz ? szek[i][1] : szek[i][0];
}

int main()
{
    ifstream be;
    be.open("mozi.be");
    be >> m >> n;
    for (int i = 1; i<= n; ++i) {
        be >> szek[i][0] >> szek[i][1];
        igenyek[szek[i][0]].insert(i);
        igenyek[szek[i][1]].insert(i);
    }
    be.close();
    // Eloszor amig van olyan szek, amire csak egy igeny van,
    // ezeket kiosztjuk.
    int k = 1;
    while (k <= m) {
        while (k <= m && igenyek[k].size() != 1) {
            ++k;
        }
        if (k <= m) {
            int igeny = *igenyek[k].begin();
            kiosztas.push_back(make_pair(igeny, k));
            igenyek[k].clear();
            igenyek[masikszek(igeny, k)].erase(igeny);
        }
    }
    // Most mar minden szekre >= 2 igeny van, koroket keresunk.
    k = 1;
    while (k <= m) {
        while (k <= m && igenyek[k].empty()) {
            ++k;
        }
        if (k <= m) {
            while (!igenyek[k].empty()) {
                int igeny = *igenyek[k].begin();
                kiosztas.push_back(make_pair(igeny, k));
                igenyek[k].clear();
                igenyek[masikszek(igeny, k)].erase(igeny);
                k = masikszek(igeny, k);
            }
        }
    }
    ofstream ki;
    ki.open("mozi.ki");
    ki << kiosztas.size() << endl;
    for (int i = 0; i < kiosztas.size(); ++i) {
        ki << kiosztas[i].first << " " << kiosztas[i].second << endl;
    }
    ki.close();
    return 0;
}
