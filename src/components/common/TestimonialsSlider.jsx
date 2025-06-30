import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import { Navigation, Pagination, Autoplay } from 'swiper/modules';

const TestimonialsSlider = () => {
  return (
    <Swiper
      modules={[Navigation, Pagination, Autoplay]}
    //   false the autoplay 
    //   add direction horizontal
      spaceBetween={20}  // Space between slides
      slidesPerView={3}  // Show 3 slides (1 full + half slides on both sides)
      centeredSlides={true} // Center the active slide
      autoplay={{
        delay: 4000,
        disableOnInteraction: false,
      }}
      speed={2000}
      loop={true} // Enable infinite looping
      slidesPerGroup={1}
      
      className="testimonials-swiper"
      loopAdditionalSlides={1} // Add extra slides for smoother looping
      breakpoints={{
        0: {
          slidesPerView: 1, // 1 slide for small screens
          spaceBetween: 0,
          centeredSlides: false,
        },
        768: {
          slidesPerView: 2, // 2 slides for medium screens
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
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-01.mp4" controls playsInline />
          </div>
          <h4 className='text-white  text-[35px] leading-[1.1] mb-[20px] font-bold'>
          Custom Web Portal Success
          </h4>
          <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-02.mp4" controls playsInline />
          </div>
          <h4 className='text-white  text-[35px] leading-[1.1] mb-[20px] font-bold'>
          Custom Web Portal Success
          </h4>
          <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-03.mp4" controls playsInline />
          </div>
          <h4 className='text-white  text-[35px] leading-[1.1] mb-[20px] font-bold'>
          Custom Web Portal Success
          </h4>
          <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-04.mp4" controls playsInline />
          </div>
          <h4 className='text-white  text-[35px] leading-[1.1] mb-[20px] font-bold'>
          Custom Web Portal Success
          </h4>
          <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-05.mp4" controls playsInline />
          </div>
          <h4 className='text-white  text-[35px] leading-[1.1] mb-[20px] font-bold'>
          Custom Web Portal Success
          </h4>
          <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-06.mp4" controls playsInline />
          </div>
          <h4 className='text-white  text-[35px] leading-[1.1] mb-[20px] font-bold'>
          Custom Web Portal Success
          </h4>
          <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-07.mp4" controls playsInline />
          </div>
          <h4 className='text-white  text-[35px] leading-[1.1] mb-[20px] font-bold'>
          Custom Web Portal Success
          </h4>
          <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim
          </p>
        </div>
      </SwiperSlide>
      
      {/* Repeat SwiperSlide components here */}
    </Swiper>
  );
};

export default TestimonialsSlider;
