import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key, this.folderName});

  final folderName;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          _projectHeader(widget.folderName),
          Container(
            height: 130,
            child: ListView(
              padding: const EdgeInsets.only(left: 24, top: 24),
              scrollDirection: Axis.horizontal,
              children: [
                _buildAvatarRow(name: 'Sam', fileName: 'sam.jpg'),
                _buildAvatarRow(name: 'Hamza', fileName: 'hamza.jpg'),
                _buildAvatarRow(name: 'Joy', fileName: 'joy.jpg'),
                _buildAvatarRow(name: 'Ligen', fileName: 'ligen.jpg'),
                _buildAvatarRow(name: 'Mustak', fileName: 'mustak.jpg'),
                _buildAvatarRow(name: 'Shahin', fileName: 'shahin.jpg'),
                _buildAvatarRow(name: 'Shahid', fileName: 'shahid.jpeg'),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 18),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Files',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Create New',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    ),
                  ],
                ),
                _projectCreateSection('Assets', redAlart: true),
                _projectCreateSection('BrandBook'),
                _projectCreateSection('Design'),
                _projectCreateSection('Moodboards'),
                _projectCreateSection('Others'),
                _projectCreateSection('Old'),
                _projectCreateSection('Demo'),
                _projectCreateSection('More'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue.shade200,
        selectedIndex: _currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) {
          _currentIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.access_time_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box),
            label: 'Home',
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: 8, blurRadius: 1)
        ]),
        child: FloatingActionButton(
          backgroundColor: Colors.blue.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _projectCreateSection(String name, {bool redAlart = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.folder,
                    color: Colors.blue.shade200,
                    size: 24,
                  ),
                  if (redAlart == true)
                    Positioned(
                      right: -1,
                      top: 2,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 3.5,
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(width: 12),
              Text(
                name,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          const Icon(Icons.more_vert_outlined)
        ],
      ),
    );
  }

  Widget _buildAvatarRow({required String name, required String fileName}) {
    return  Padding(
      padding: EdgeInsets.only(right: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/$fileName'),
            backgroundColor: Colors.white,
            radius: 30,
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget _projectHeader(String fileName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      alignment: Alignment.bottomCenter,
      height: 160,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                fileName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Project',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: 26,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.blue,
                    size: 26,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
