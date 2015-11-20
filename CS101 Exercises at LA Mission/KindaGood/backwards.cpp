#include <iostream>
#include <string>
using namespace std;
int main()
{
    cout << "Enter a word to be displayed backwards:";
    string word;
    cin >> word;
    for(int w = word.size() - 1; w >=-1; w--)
        {
            cout << word[w];
        }
    cout << "\n\bBye.\n";
    system("pause");
    return 0;
}
