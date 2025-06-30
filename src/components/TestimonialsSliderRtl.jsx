import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import { Navigation, Pagination, Autoplay } from 'swiper/modules';

const TestimonialsSliderRtl = () => {
  return (
    <Swiper
      modules={[Navigation, Pagination, Autoplay]}
    //   add direction horizontal
      spaceBetween={20}  // Space between slides
      slidesPerView={3}  // Show 3 slides (1 full + half slides on both sides)
      centeredSlides={true} // Center the active slide
      autoplay={{
        delay: 0,
        disableOnInteraction: false,
        reverseDirection: true,
      }}
      speed={4000}
      loop={true} // Enable infinite looping
      slidesPerGroup={1}
      direction="horizontal"  // Horizontal sliding
      className="testimonials-swiper"
      loopAdditionalSlides={1} // Add extra slides for smoother looping
      breakpoints={{
        640: {
          slidesPerView: 1, // 1 slide for small screens
          spaceBetween: 10,
          centeredSlides: true,
        },
        768: {
          slidesPerView: 2, // 2 slides for medium screens
          spaceBetween: 20,
          centeredSlides: true,
        },
        1024: {
          slidesPerView: 3, // 3 slides for large screens
          spaceBetween: 30,
          centeredSlides: true,
        },
      }}
    >
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="flex items-center justify-between mb-[20px]">
            <div className="flex items-center gap-[30px]">
              <div className="testimonials-card-img">
                <img src="/src/assets/images/profile-01.png" alt="profile-01" />
              </div>
              <div>
                <h4 className="text-white text-[28px] font-bold text-right">Sophia L.</h4> {/* Text aligned to the right */}
              </div>
            </div>
            <div>
              <ul className="star-rating">
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
              </ul>
            </div>
          </div>
          <p className="text-[#666666] text-[25px] text-right"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="flex items-center justify-between mb-[20px]">
            <div className="flex items-center gap-[30px]">
              <div className="testimonials-card-img">
                <img src="/src/assets/images/profile-01.png" alt="profile-01" />
              </div>
              <div>
                <h4 className="text-white text-[28px] font-bold text-right">Sophia L.</h4> {/* Text aligned to the right */}
              </div>
            </div>
            <div>
              <ul className="star-rating">
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
              </ul>
            </div>
          </div>
          <p className="text-[#666666] text-[25px] text-right"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="flex items-center justify-between mb-[20px]">
            <div className="flex items-center gap-[30px]">
              <div className="testimonials-card-img">
                <img src="/src/assets/images/profile-01.png" alt="profile-01" />
              </div>
              <div>
                <h4 className="text-white text-[28px] font-bold text-right">Sophia L.</h4> {/* Text aligned to the right */}
              </div>
            </div>
            <div>
              <ul className="star-rating">
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
              </ul>
            </div>
          </div>
          <p className="text-[#666666] text-[25px] text-right"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="flex items-center justify-between mb-[20px]">
            <div className="flex items-center gap-[30px]">
              <div className="testimonials-card-img">
                <img src="/src/assets/images/profile-01.png" alt="profile-01" />
              </div>
              <div>
                <h4 className="text-white text-[28px] font-bold text-right">Sophia L.</h4> {/* Text aligned to the right */}
              </div>
            </div>
            <div>
              <ul className="star-rating">
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
              </ul>
            </div>
          </div>
          <p className="text-[#666666] text-[25px] text-right"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="flex items-center justify-between mb-[20px]">
            <div className="flex items-center gap-[30px]">
              <div className="testimonials-card-img">
                <img src="/src/assets/images/profile-01.png" alt="profile-01" />
              </div>
              <div>
                <h4 className="text-white text-[28px] font-bold text-right">Sophia L.</h4> {/* Text aligned to the right */}
              </div>
            </div>
            <div>
              <ul className="star-rating">
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
              </ul>
            </div>
          </div>
          <p className="text-[#666666] text-[25px] text-right"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="flex items-center justify-between mb-[20px]">
            <div className="flex items-center gap-[30px]">
              <div className="testimonials-card-img">
                <img src="/src/assets/images/profile-01.png" alt="profile-01" />
              </div>
              <div>
                <h4 className="text-white text-[28px] font-bold text-right">Sophia L.</h4> {/* Text aligned to the right */}
              </div>
            </div>
            <div>
              <ul className="star-rating">
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
              </ul>
            </div>
          </div>
          <p className="text-[#666666] text-[25px] text-right"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="flex items-center justify-between mb-[20px]">
            <div className="flex items-center gap-[30px]">
              <div className="testimonials-card-img">
                <img src="/src/assets/images/profile-01.png" alt="profile-01" />
              </div>
              <div>
                <h4 className="text-white text-[28px] font-bold text-right">Sophia L.</h4> {/* Text aligned to the right */}
              </div>
            </div>
            <div>
              <ul className="star-rating">
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
                <li><i className="fa-solid fa-star"></i></li>
              </ul>
            </div>
          </div>
          <p className="text-[#666666] text-[25px] text-right"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      {/* Repeat SwiperSlide components here */}
    </Swiper>
  );
};

export default TestimonialsSliderRtl;
