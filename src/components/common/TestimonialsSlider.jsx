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
      // autoplay={{
      //   delay: 4000,
      //   disableOnInteraction: false,
      // }}
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
          <div className='test-card-content'>
            <h4 className='text-white  text-[24px] leading-[1.1] mb-[20px] font-bold'>
              Custom Web Portal Success
            </h4>
          </div>
          <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
            Watch how our custom web portal transforms your business operations.
          </p>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-02.mp4" controls playsInline />
          </div>
          <div className='test-card-content'>

            <h4 className='text-white  text-[24px] leading-[1.1] mb-[20px] font-bold'>
              Author website with Digital Transformation
            </h4>
            <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
              Discover the journey of Michael’s digital evolution. Watch his testimonial video to learn how we elevate your online presence.
            </p>

          </div>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-03.mp4" controls playsInline />
          </div>
          <div className='test-card-content'>

            <h4 className='text-white  text-[24px] leading-[1.1] mb-[20px] font-bold'>
              Ecommerce Website and Mobile App Success
            </h4>
            <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
              Experience the impact of our custom e-commerce website and mobile app solutions for B2C and B2B markets. Witness the streamlined operations and enhanced client experiences.
            </p>
          </div>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-04.mp4" controls playsInline />
          </div>
          <div className='test-card-content'>

            <h4 className='text-white  text-[24px] leading-[1.1] mb-[20px] font-bold'>
              Elevating Realtor's Online Presence and Sales
            </h4>
            <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
              Experience how our custom website and comprehensive 360-degree digital marketing solutions have significantly enhanced operations and driven sales for realtors.
            </p>
          </div>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-05.mp4" controls playsInline />
          </div>
          <div className='test-card-content'>

            <h4 className='text-white  text-[24px] leading-[1.1] mb-[20px] font-bold'>
              Achieving YouTube Monetization and Media Management Success

            </h4>
            <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
              Discover how our tailored media management and strategic support helped propel YouTubers towards YouTube monetization approval. Watch the testimonial to see how we optimized their channel and content strategy for growth and profitability.


            </p>
          </div>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-06.mp4" controls playsInline />
          </div>
          <div className='test-card-content'>

            <h4 className='text-white  text-[24px] leading-[1.1] mb-[20px] font-bold'>
              Driving Ecommerce Success with Social Media Marketing and SEO

            </h4>
            <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
              Explore how our expert social media marketing and SEO strategies propelled e-commerce stores to new heights. Watch the testimonial to see how we boosted visibility increased traffic and optimized conversions for our client’s online stores.


            </p>
          </div>
        </div>
      </SwiperSlide>
      <SwiperSlide>
        <div className="testimonials-card">
          <div className="video-wrapper">
            <video src="/src/assets/videos/test-07.mp4" controls playsInline />
          </div>
          <div className='test-card-content'>

            <h4 className='text-white  text-[24px] leading-[1.1] mb-[20px] font-bold'>
              Enhancing Operations in the Canadian and American Oil Industry with Custom Website and 360° Marketing

            </h4>
            <p className="text-[#666666] text-[20px]"> {/* Text aligned to the right */}
              Discover how our tailored custom website and comprehensive 360° marketing strategies have redefined operations for Canadian clients in the oil industry. Watch the testimonial to see how we elevate visibility, attracted leads, and optimized marketing efforts for sustainable growth.
            </p>
          </div>
        </div>
      </SwiperSlide>

      {/* Repeat SwiperSlide components here */}
    </Swiper>
  );
};

export default TestimonialsSlider;
