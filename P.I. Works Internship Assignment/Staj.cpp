#include<iostream>
#include<memory>
#include<map>
#include<vector>
#include<queue>

using namespace std;

class Node {
public:
	Node(int p_data) : data{ p_data } {}
	Node() = default;

	Node* getReverseChild(Node* ch)
	{
		if (this->left_ch == ch) return this->right_ch;
		else if (this->right_ch == ch) return this->left_ch;
	}
	
private:
	friend class Pyramid;

	Node* left_ch{};
	Node* right_ch{};
	int data{};
};


class Pyramid {
public:
	Pyramid() = default;
	Pyramid(map<int, vector<int>> p_map) : root{ createTree(p_map) }
	{
		int h = 0, n = 1;
		for (int i = 1; i < size(p_map); ++i) {
			h += 1; n += i + 1;
		}
		height = h; numberNode = n;
	}

	Node* getRoot() { return root; }

	Node* insertValue(Node* root, vector<int> vec, queue<Node*>& q)
	{
		bool control_flag = false;
		for (int i = 0; i < size(vec); i++) {

			auto node = new Node(vec[i]);

			if (root == nullptr)	root = node;

			else if (q.front()->left_ch == nullptr && !control_flag)	q.front()->left_ch = node;

			else if (q.front()->left_ch == nullptr && control_flag) {
				q.front()->left_ch = q.back();
				goto jump;
			}

			else if (q.front()->right_ch == nullptr) {
			jump:
				q.front()->right_ch = node;
				q.pop();
				control_flag = true;
			}
			q.push(node);
		}
		return root;
	}

	Node* createTree(map<int, vector<int>> p_map)
	{
		Node* root = nullptr;
		queue<Node*> q;

		try
		{
			for (int i = 0; i < size(p_map.at(i)); i++)
				root = insertValue(root, p_map[i], q);
		}
		catch (const std::exception& exp) 
		{
			cout << "Map has no element " << exp.what() << endl;
		}
		return root;
	}

	bool isPrime(int p_number)
	{
		int i = 2;
		while (p_number > i)
		{
			if (p_number % i == 0)
				return false;
			i++;
		}
		return true;
	}

	Node* iteration(Node* p_root)
	{
		if (auto max_number_node = (p_root->left_ch->data > p_root->right_ch->data) ?
			p_root->left_ch : p_root->right_ch; !isPrime(max_number_node->data))	return max_number_node;
		else if (max_number_node = p_root->getReverseChild(max_number_node); !isPrime(max_number_node->data))	return max_number_node;
		return nullptr;
	}

	int complateProcess(Node* p_node)
	{		
		int sum = 0;
		while (p_node) {
			sum = p_node->data;
			if (p_node->left_ch || p_node->right_ch)
				return sum += complateProcess(iteration(p_node));
		}
		return sum;
	}

private:
	Node* root{};
	int numberNode{};
	int height{};
};

int main()
{
	map<int, vector<int>> my_map;
	int pyramidHeight;

	cout << "Please enter your pyramid height\n";
	cin >> pyramidHeight;

	for (size_t i = 1; i <= pyramidHeight + 1; i++) {
		for (size_t j = 1; j < i + 1; ++j) {
			cout << "Enter " << i << ". row's " << j << ". element\n";
			int element;
			cin >> element;
			my_map[i - 1].push_back(element);
		}
	}

	Pyramid my_pyramid{ my_map };
	auto sum = my_pyramid.complateProcess(my_pyramid.getRoot());
	
	cout <<"Pyramid sum is : " << sum << endl;
}