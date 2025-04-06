import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_lab_app/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.imageUrl, required this.onUpload});

  final String? imageUrl;
  final void Function(String imageUrl) onUpload;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child:
                imageUrl != null
                    ? ClipOval(
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    )
                    : const Center(
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 50,
            );

            if (image == null) return;

            final imgeExtension = image.path.split('.').last.toLowerCase();

            final imageBytes = await image.readAsBytes();
            final userId = supabase.auth.currentUser!.id;
            final imagePath = '/$userId/profile';

            await supabase.storage
                .from('profiles')
                .uploadBinary(
                  imagePath,
                  imageBytes,
                  fileOptions: FileOptions(
                    upsert: true,
                    contentType: 'image/$imgeExtension',
                  ),
                );

            String imageUrl = supabase.storage
                .from('profiles')
                .getPublicUrl(imagePath);

            imageUrl =
                Uri.parse(imageUrl)
                    .replace(
                      queryParameters: {
                        't': DateTime.now().millisecondsSinceEpoch.toString(),
                      },
                    )
                    .toString();

            onUpload(imageUrl);
          },
          child: const Text('Upload'),
        ),
      ],
    );
  }
}
