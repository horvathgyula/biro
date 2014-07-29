#include <fstream>
#include <vector>

using namespace std;

int main()
{
    ifstream be;
    be.open("gepek.be");
    int n, m;
    be >> n >> m;
    vector<int> munkak[10001];
    for (int i = 1; i <= m; ++i) {
        int hatarido;
        be >> hatarido;
        munkak[hatarido].push_back(i);
    }
    be.close();
    int db = 0;
    int gepek = 1;
    for (int i = 1; i <= n; ++i) {
        db += munkak[i].size();
        while (db > i * gepek) {
            ++gepek;
        }
    }
    int nap[100001];
    int gep[100001];
    int gep_szam = 1;
    int nap_szam = 1;
    for (int i = 1; i <= n; ++i) {
        for (int j = 0; j < munkak[i].size(); ++j) {
            nap[munkak[i][j]] = nap_szam;
            gep[munkak[i][j]] = gep_szam;
            ++gep_szam;
            if (gep_szam > gepek) {
                gep_szam = 1;
                ++nap_szam;
            }
        }
    }
    ofstream ki;
    ki.open("gepek.ki");
    ki << gepek << endl;
    for (int i = 1; i <= m; ++i) {
        ki << nap[i] << " " << gep[i] << endl;
    }
    ki.close();
    return 0;
}
