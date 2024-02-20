#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

int calcav(const std::vector<int>& l) {
    int av = 0;
    for (size_t index = 0; index < l.size(); ++index) {
        if (index == l.size() - index - 1 || index + 1 > l.size() - index - 1)
            break;
        int ad = std::abs(l[index] - l[l.size() - index - 1]);
        av += ad;
    }
    return av;
}

std::vector<std::vector<int> > chunk(const std::vector<int>& arr, int size) {
    std::vector<std::vector<int> > final;
    for (size_t i = 0; i < arr.size(); ++i) {
        if (i + size > arr.size() + 1)
            break;
        final.push_back(std::vector<int>(arr.begin() + i, arr.begin() + i + size));
    }
    return final;
}

int main() {
    int init;
    std::cin >> init;
    std::vector<int> nums(init);
    for (int i = 0; i < init; ++i)
        std::cin >> nums[i];

    std::vector<std::string> f;

    for (size_t i = 0; i < nums.size(); ++i) {
        int cur = -1;

        for (const auto& j : chunk(nums, i + 1)) {
            int r = calcav(j);
            if (cur == -1)
                cur = r;
            if (cur > r)
                cur = r;
        }

        f.push_back(std::to_string(cur));
    }

    std::cout << f[0];
    for (size_t i = 1; i < f.size(); ++i)
        std::cout << ' ' << f[i];
    std::cout << std::endl;

    return 0;
}
