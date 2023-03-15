console.log('뭐')
console.log(Kakao.Auth.getAccessToken())

function kakaoInfo() {
    if (Kakao.Auth.getAccessToken()) {
        $('#dum').append('<a href="javascript:kakaoLogout()">카카오 로그아웃</a>')
        console.log('Not logged in.');
        return;
    }


}
function kakaoInfo2() {

    Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
            console.log(res);
            // 이메일, 성별, 닉네임, 프로필이미지
            var email = res.kakao_account.email;
            // var gender = res.kakao_account.gender;
            var nickname = res.kakao_account.profile.nickname;
            var kakao_id = res.id
            // var profile_image = res.kakao_account.profile.thumbnail_image_url;

            // console.log(email, gender, nickname, profile_image);
            console.log(email, nickname);

            // $('#id').val(email)
            // $('#pw').val(kakao_id)
            // $('#address').val(email)
            // $('#submitBtn').attr("type", "submit")
            // $('#submitBtn').click();
        },
        fail: function (error) {
            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
        }
    });

}