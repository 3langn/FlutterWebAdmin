import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:university_admin/ultis/regrex.dart';

const text = """<div>
<p style="text-align: justify;"><strong><a title="Công nghệ thông tin" href="">Công nghệ thông tin</a> (Tin học ứng dụng) là gì?</strong></p>
<p style="text-align: justify;">Ngành <span style='color: rgb(255, 0, 0);'>Công nghệ thông tin</span>   là 1 ngành nghề rộng lớn, bao gồm nhiều lĩnh vực, có ảnh hưởng tới nhiều ngành nghề khác nhau của xã hội. Bạn có thể tạm hiểu: <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a> là 1 ngành sử dụng hệ thống các thiết bị và máy tính, bao gồm phần cứng, phần mềm, để cung cấp giải pháp xử lý thông tin trên nền công nghệ cho các cá nhân, tổ chức có yêu cầu.
Tin học ứng dụng là một trong các cách gọi của ngành <a title="Công nghệ thông tin" href="">Công nghệ thông tin</a>.</p>
<p style="text-align: justify;">“<a title="Công nghệ thông tin" href="">Công nghệ thông tin</a>” – gọi tắt là IT (Information Technology) trên thế giới bao gồm khoa học máy tính và kỹ thuật máy tính. Ở Việt Nam, phạm vi của <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a> khá rộng, có thể chứa ngoài lĩnh vực máy tính. Nhu cầu xã hội trong ngành này chủ yếu tập trung vào: lập trình viên, kỹ sư hệ thống mạng, kỹ sư phần cứng, kỹ thuật viên – chuyên viên thiết kế lập trình web, lập trình điện thoại di động, game, an ninh mạng…
 "><strong>Thực trạng nhu cầu nguồn nhân lực của ngành <h2>Công nghệ thong tin</h2> (Tin học ứng dụng) trong xã hội hiện nay và tương lai:&nbsp;“khát” nhân lực trầm trọng</strong></p>
<p style="text-align: justify;">Trong xu thế Thế giới chúng ta đang chuyển sang thời đại số hóa – Ngày nay, không có một ngành công nghiệp nào thiếu sự hiện diện của <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a>, đặc biệt đối với các ngành Công kỹ nghệ như Cơ điện tử, gia công khuôn mẫu, ngành sản xuất các thiết bị tự động, kỹ thuật robotics, với sự ra đời của các máy điều khiển chương trình số (CNC), các thiết bị điều khiển số (PLC), đã chứng minh <a title="Công nghệ Thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ Thông tin</a> ngày càng có vai trò không thể thiếu được trong bước phát triển vượt bậc của Đất nước chúng ta trong giai đoạn hội nhập này.</p>
<p style="text-align: justify;">Với mức tăng trưởng mạnh mẽ, thị trường <a title="công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">công nghệ thông tin</a> ở Việt Nam đang “khát” nhân lực trầm trọng. Dự báo từ Vietnamworks, nước ta cần khoảng 1,2 triệu lao động IT tính đến năm 2020.</p>
<p style="text-align: justify;">Trên thế giới, và ngay tại Việt Nam, <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a> là một trong những nhóm ngành dẫn đầu về nhu cầu nhân lực. Nhiều doanh nghiệp thiếu nhân lực <a title="công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">công nghệ thông tin</a> trầm trọng, phải săn đón sinh viên từ khi chưa ra trường. Con số 1,2 triệu lao động chỉ là một trong những thống kê cho thấy, có rất nhiều cơ hội cho những người trẻ đam mê <a title="công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">công nghệ thông tin</a> khi theo đuổi ngành nghề này.</p>
<p><strong>Ngành <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a> (Tin học ứng dụng) học những gì?</strong></p>
<p style="text-align: justify;">Ngành <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a> (Tin học ứng dụng) trang bị cho sinh viên những kiến thức về:</p>
<p style="text-align: justify;">– Kỹ thuật lập trình, Thiết kế web, công nghệ phần mềm, Phân tích thiết kế hệ thống, Cơ sở dữ liệu và hệ quản trị cơ sở dữ liệu, Công nghệ JAVA , Lập trình hướng đối tượng, Đồ họa ứng dụng, Thiết kế hoạt ảnh, Xây dựng các phần mềm quản lý …</p>
<p style="text-align: justify;">– Ngoài ra bạn cũng được trang bị các kiến thức về Kiến trúc máy tính, Mạng máy tính, Quản trị mạng, Quản trị WEB server,…</p>
<p style="text-align: justify;">– Không thể thiếu đó là bạn được rèn luyện kỹ năng nghe, nói, đọc, viết tiếng Anh giao tiếp và cả tiếng Anh chuyên ngành, rèn luyện và phát triển các kỹ năng cá nhân,…</p>
<p><strong>Sinh viên có khả năng:</strong></p>

<p>– Có khả năng lập trình, thiết kế xây dựng, bảo trì website, xây dựng các ứng dụng cho các doanh nghiệp, công ty. Ngoài ra sinh viên cũng có khả năng vận hành và nâng cấp phát triển các ứng dụng phần mềm của các công ty và doanh nghiệp, khai thác bảo trì các hệ thống cơ sở dữ liệu, bạn cũng có thể sử dụng và quản trị hệ thống mạng máy tính của doanh nghiệp.</p>
<p style="text-align: justify;">– Công việc của các chuyên viên phần mềm là thiết kế, xây dựng các phần mềm quản lý, phần mềm theo nhu cầu riêng của các doanh nghiệp, phát triển và vận hành website cho công ty và doanh nghiệp, sinh viên có thể là lập trình viên, nhân viên kiểm thử phần mềm hay khảo sát, đặc tả các yêu cầu khách hành và phân tích giải pháp để phát triển ứng dụng theo nhu cầu doanh nghiệp. Phải biên soạn, rà soát các tài liệu hướng dẫn người sử dụng, tham gia triển khai và chuyển giao sản phẩm công nghệ cho khách hàng, hỗ trợ kỹ thuật, bảo trì, bảo hành sản phẩm sau khi chuyển giao, tham gia đào tạo cho khách hàng sử dụng sản phẩm.</p>
<p style="text-align: justify;">– Có khả năng học tập ở trình độ cao hơn để nâng cao trình độ nghiệp vụ, hoặc học thêm các chuyên ngành khác cùng ngành hoặc khác ngành.</p>
<p style="text-align: justify;">– Ngoại Ngữ: B1 (Khung tham chiếu Châu Âu về Ngôn Ngữ).</p>
<p><strong>&nbsp;Những tố chất của người học <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a> (Tin học ứng dụng):</strong></p>
<p>Để kiểm tra mình có phù hợp với ngành nghề này, bạn hãy xem câu trả lời của bạn có phải là “đúng” hoặc “có” cho hầu hết các đặc điểm dưới đây không:</p>
<p>• Thông minh, tư duy logic tốt<br>
• Khả năng phân tích, suy luận, xâu chuỗi các <a title="sự kiện" href="https://edu.vov.vn/?cat=180">sự kiện</a><br>
• Khả năng sáng tạo và tìm ra các giả thuyết mới<br>
• Yêu thích và có khả năng làm việc lâu với máy tính<br>
• Yêu thích khoa học, thích các trò chơi trí tuệ<br>
• Học tốt môn toán, đặc biệt môn đại số<br>
• Kiên trì, cẩn thận, chịu được áp lực cao<br>
• Vốn ngoại ngữ là cần thiết trong công việc</p>

<p><strong>Cơ hội việc làm của ngành <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a> (Tin học ứng dụng):</strong></p>
<p style="text-align: justify;">Người kỹ thuật viên với cương vị người vận hành, quản lý hệ thống, điều phối kỹ thuật trong:<br>
– Các công ty phát triển phần mềm, thiết kế website, gia công phần mềm; các công ty tư vấn – thiết kế giải pháp mạng, giải pháp <a title="CNTT" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">CNTT</a> .<br>
– Các doanh nghiệp, công ty bảo trì, lắp ráp, phân phối máy tính và các thiết bị tin học.<br>
– Các cơ quan, nhà máy, trường học, ngân hàng,…, các doanh nghiệp có ứng dụng CNTT và chuyển giao công nghệ thuộc lĩnh vực <a title="CNTT" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">CNTT</a>.</p>
<p style="text-align: justify;">Hiện này ngành này nhu cầu rất cao vì công ty doanh nghiệp nào cũng có website cần xây dựng và duy trì phát triển hàng ngày, vì nay thời đại của <a title="công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">công nghệ thông tin</a>, <a title="truyền thông" href="http://tuyensinhvov.edu.vn/cndientutruyenthong/">truyền thông</a>, thương mại điện tử các doanh nghiệp đều triển khai việc quảng bá hình ảnh công ty và kinh doanh trên mạng nên cần có người quản lý website, thiết kế xây dựng, phát triển và duy trì website. Hơn nữa nhu cầu có những sản phẩm phần mềm đặc thù cho doanh nghiệp nên bạn có thể làm việc ở bất kỳ ở công ty doanh nghiệp nào, từ trường học, bệnh viện, cơ quan xí nghiệp.</p>
<p>Hiện tại ở Việt Nam nói chung và Thành phố Hồ Chí Minh riêng có rất nhiều công ty phát triển phần mềm và công ty gia công phần mềm cho nước ngoài đang hoạt động nên bạn có thể là thành viên của những công ty này.</p>
<p><strong>Cơ hội việc làm của ngành <a title="Công nghệ thông tin" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">Công nghệ thông tin</a> (Tin học ứng dụng):</strong></p>
<p style="text-align: justify;">Người kỹ thuật viên với cương vị người vận hành, quản lý hệ thống, điều phối kỹ thuật trong:<br>
– Các công ty phát triển phần mềm, thiết kế website, gia công phần mềm; các công ty tư vấn – thiết kế giải pháp mạng, giải pháp <a title="CNTT" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">CNTT</a> .<br>
– Các doanh nghiệp, công ty bảo trì, lắp ráp, phân phối máy tính và các thiết bị tin học.<br>
– Các cơ quan, nhà máy, trường học, ngân hàng,…, các doanh nghiệp có ứng dụng CNTT và chuyển giao công nghệ thuộc lĩnh vực <a title="CNTT" href="http://tuyensinhvov.edu.vn/nganh_cong_nghe_thong_tin/">CNTT</a>.</p>
<p style="text-align: justify;">Hiện này ngành này nhu cầu rất cao vì công ty doanh nghiệp nào cũng có website cần xây dựng và duy trì phát triển hàng ngày, vì nay thời đại của Công nghệ thông tin, <a title="truyền thông" href="http://tuyensinhvov.edu.vn/cndientutruyenthong/">truyền thông</a>, thương mại điện tử các doanh nghiệp đều triển khai việc quảng bá hình ảnh công ty và kinh doanh trên mạng nên cần có người quản lý website, thiết kế xây dựng, phát triển và duy trì website. Hơn nữa nhu cầu có những sản phẩm phần mềm đặc thù cho doanh nghiệp nên bạn có thể làm việc ở bất kỳ ở công ty doanh nghiệp nào, từ trường học, bệnh viện, cơ quan xí nghiệp.</p>
<p style="text-align: justify;">Hiện tại ở Việt Nam nói chung và các thành phố lớn nói riêng có rất nhiều công ty phát triển phần mềm và công ty gia công phần mềm cho nước ngoài đang hoạt động nên bạn có thể là thành viên của những công ty này.</p>
<p style="text-align: justify;"><strong>Mức lương có thể đạt được:</strong></p>
<p style="text-align: justify;">Công việc này đòi hỏi sự sáng tạo, tư duy và công sức rất nhiều vì công nghệ phát triển rất nhanh nên một chuyên viên lập trình coder, kiểm thử phần mềm (tester) hay các công việc liên quan đến lĩnh vực này, rất nhiều áp lực, đòi hỏi sự nỗ lực không ngừng thì thu nhập mà các chuyên viên phần mềm nhận được cũng tương xứng.</p>
<p style="text-align: justify;">Hiện nay, nhu cầu tuyển dụng nhân sự cho vị trí thiết kế website, bảo trì và vận hành website của các công ty khá lớn. Đồng thời, mức lương mà các nhân viên thuộc lĩnh vực này nhận được tương đối cao. Trong thời gian thử việc thu nhập từ 200 – 250 USD/tháng. Nhân viên chính thức thường nhận từ 250 – 400 USD/tháng, 300 – 600 USD/tháng. Còn chuyên viên lập trình, phân tích thiết kế và vận hành dự án phần mềm thì lương cao hơn có thể lên từ nghìn USD hay cao hơn tùy vị trí.</p>
</div>
</div>""";

class Emulation extends StatelessWidget {
  const Emulation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);

    return Expanded(
      flex: 3,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: size.width * 0.26,
            child: Image.asset(
              'assets/images/iphoneEmulator.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: size.height * 0.055,
            right: size.height * 0.089,
            child: Container(
              height: size.height * 0.77,
              width: size.width * 0.173,
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.68 * 1 / 12),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    color: Colors.white,
                    child: Html(data: removeAllHtmlTags(text)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmulationAppBar extends StatelessWidget {
  const EmulationAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      height: size.height * 0.68 * 1 / 10,
      width: size.width * 0.21,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(1, 2), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        'Ngành Công nghệ thông tin',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
