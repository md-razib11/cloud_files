import 'package:cloud_files/pages/project_page.dart';
import 'package:flutter/material.dart';

class TeamFolder extends StatefulWidget {
  const TeamFolder({super.key});

  @override
  State<TeamFolder> createState() => _TeamFolderState();
}

class _TeamFolderState extends State<TeamFolder> {
  double availableScreenWidth = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.sizeOf(context).width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _storageInformation(),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                _storageView(title: 'SOURCES', color: Colors.blue, width: .3),
                const SizedBox(width: 2),
                _storageView(title: 'DOCS', color: Colors.red, width: .25),
                const SizedBox(width: 2),
                _storageView(title: 'IMAGES', color: Colors.yellow, width: .2),
                const SizedBox(width: 2),
                _storageView(title: '', color: Colors.white, width: .23),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Divider(),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: [
                const Text(
                  'Recently Updated',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    _recentUpdatedSection(
                        image: 'sketch',
                        fileName: 'desktop',
                        fileExtension: '.sketch'),
                    SizedBox(width: availableScreenWidth * 0.031),
                    _recentUpdatedSection(
                        image: 'sketch',
                        fileName: 'mobile',
                        fileExtension: '.sketch'),
                    SizedBox(width: availableScreenWidth * 0.031),
                    _recentUpdatedSection(
                        image: 'prd',
                        fileName: 'interaction',
                        fileExtension: '.prd'),
                  ],
                ),
                const SizedBox(height: 60),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Projects',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                const SizedBox(height: 14),
                _projectCreateSection('Chatbox'),
                _projectCreateSection('NoteBook'),
                _projectCreateSection('Life'),
                _projectCreateSection('Beautiful'),
              ],
            ),
          )
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

  Widget _projectCreateSection(String name) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProjectPage(folderName: name,)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.grey.shade200, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.folder,
                  color: Colors.blue.shade200,
                  size: 24,
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
      ),
    );
  }

  Padding _storageInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
                text: 'Storage',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                children: [
                  TextSpan(
                    text: " 9.1/10GB",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ]),
          ),
          const Text(
            'Upgrade',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.blue, fontSize: 18),
          )
        ],
      ),
    );
  }

  Widget _recentUpdatedSection({
    required String image,
    required String fileName,
    required String fileExtension,
  }) {
    return Column(
      children: [
        Container(
          height: availableScreenWidth * .31,
          width: availableScreenWidth * .31,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.all(38),
          child: Image.asset('assets/images/$image.png'),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
              text: fileName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: fileExtension,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                )
              ]),
        ),
      ],
    );
  }

  Widget _storageView(
      {required String title, required Color color, required double width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 4,
          width: availableScreenWidth * width,
          color: color,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      alignment: Alignment.bottomCenter,
      height: 160,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Riotters',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                'Team folder',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
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
