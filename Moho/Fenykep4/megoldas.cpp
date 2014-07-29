#include <fstream>
#include <queue>
#include <vector>

using namespace std;

struct vendeg {
    bool operator<(const vendeg& v) const {
        return tav > v.tav;
    }
    int tav, erk, id;
};

int main()
{
    ifstream be;
    be.open("fenykep.be");
    int N, K;
    be >> N >> K;
    // Adott idopontban erkezo vendegek listai
    vector<vendeg> erk[10001];
    int maxtav = 0;
    for (int i = 1; i <= N; ++i) {
        vendeg v;
        be >> v.erk >> v.tav;
        v.id = i;
        erk[v.erk].push_back(v);
        maxtav = max(maxtav, v.tav);
    }
    be.close();
    priority_queue<vendeg> jelen;
    vector<vector<int> > fenykep;
    for (int i = 1; i <= maxtav; ++i) {
        for (int j = 0; j < erk[i].size(); ++j) {
            jelen.push(erk[i][j]);
        }
        if (jelen.size() >= K) {
            fenykep.push_back(vector<int>(K, 0));
            for (int m = 0; m < K; ++m) {
                fenykep.back()[m] = jelen.top().id;
                jelen.pop();
            }
        }
        while (!jelen.empty() && jelen.top().tav == i) {
            jelen.pop();
        }
    }
    ofstream ki;
    ki.open("fenykep.ki");
    ki << fenykep.size() << endl;
    for (int i = 0; i < fenykep.size(); ++i) {
        for (int j = 0; j < K; ++j) {
            ki << fenykep[i][j] << " ";
        }
        ki << endl;
    }
    ki.close();
    return 0;
}
