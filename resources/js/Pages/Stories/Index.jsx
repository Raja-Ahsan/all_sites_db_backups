import { useState, useEffect } from 'react';
import { Head, Link, router } from '@inertiajs/react';
import Layout from '@/Layouts/Layout';
import LikeCount from '@/Components/stories/LikeCount';
import { debounce } from 'lodash';
import Swal from 'sweetalert2';
import '@/assets/styles/stories.css';

export default function Index({ stories, filters, flash }) {
  const [search, setSearch] = useState(filters.search || '');

  // Debounce the search to avoid too many requests
  const debouncedSearch = debounce((value) => {
    router.get(route('stories.index'), { search: value, category: filters.category }, { preserveState: true });
  }, 300);

  // Handle search input change
  const handleSearchChange = (e) => {
    setSearch(e.target.value);
    debouncedSearch(e.target.value);
  };

  // Clean up debounce on unmount
  useEffect(() => {
    return () => {
      debouncedSearch.cancel();
    };
  }, []);

  // Show success message with SweetAlert2 if flash success exists
  useEffect(() => {
    if (flash?.success) {
      Swal.fire({
        title: 'Success!',
        text: flash.success,
        icon: 'success',
        confirmButtonText: 'Continue',
        confirmButtonColor: '#fea257',
        background: '#fff',
        customClass: {
          popup: 'swal-custom-popup',
          title: 'swal-custom-title',
          content: 'swal-custom-content'
        },
        didOpen: () => {
          // Replace the icon with a proper success checkmark
          setTimeout(() => {
            const iconElement = document.querySelector('.swal2-icon');
            if (iconElement) {
              // Clear existing content
              iconElement.innerHTML = '';
              iconElement.className = 'swal2-icon';

              // Create custom success icon
              const successIcon = document.createElement('div');
              successIcon.style.cssText = `
                width: 100%;
                height: 100%;
                border: 4px solid #fea257;
                border-radius: 50%;
                position: relative;
                margin: 0 auto;
                background: white;
                display: flex;
                align-items: center;
                justify-content: center;

              `;

              // Create checkmark
              const checkmark = document.createElement('div');
              checkmark.style.cssText = `
                width: 30px;
                height: 20px;
                border: 4px solid #fea257;
                border-top: none;
                border-right: none;
                transform: rotate(-45deg);
                margin-top: -5px;
              `;

              successIcon.appendChild(checkmark);
              iconElement.appendChild(successIcon);
            }
          }, 50);
        }
      });
    }
  }, [flash?.success]);

  // No automatic refresh on component mount

  return (
    <Layout headerClass="inner-header">
      <Head title="Stories" />
      <section className="stories-sec py-200 sec-bg">
        <div className="container">
          <div className="row mb-20">
            <div className="col-12 d-flex justify-content-end">
              <Link href={route('stories.create')} className="btn btn-primary">
                <i className="fas fa-plus me-2"></i>Create a story
              </Link>
            </div>
          </div>
          <div className="row text-center mb-70">
            <div className="col-12" data-aos-duration="3000" data-aos="fade-down">
              <span className="fs-32 light-black ls-8">Explore</span>
              <h2 className="heading mb-10">Our <span className="">Stories</span></h2>
              <h5 className="secondry-font fs-30 light-black mb-20">Discover Tales That Captivate</h5>
              <p className="fs-20 mb-30">
                Browse our collection of gripping stories set against richly detailed backdrops of mystery, suspense, and romance.
                Find your next literary adventure.
              </p>
            </div>
          </div>

          {/* Search Section */}
          <div className="row mb-50">
            <div className="col-md-8 col-lg-6 mx-auto">
              <div className="d-flex justify-content-center">
                <div className="flex-grow-1" style={{ maxWidth: '500px' }}>
                  <div className="input-group">
                    <span className="input-group-text text-white">
                      <i className="fas fa-search"></i>
                    </span>
                    <input
                      type="text"
                      className="form-control secondry-font"
                      placeholder="Search stories..."
                      value={search}
                      onChange={handleSearchChange}
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Spacing */}
          <div className="mb-30"></div>

          {/* Stories Grid */}
          <div className="row row-gap-40 align-items-center justify-content-center">
            {stories.data.length > 0 ? (
              stories.data.map((story) => (
                <div className="col-lg-4 col-md-6" key={story.id}>
                  <div className="cards" data-aos-duration="3000" data-aos="flip-left">
                    <div className="position-relative">
                      {/* <div className="badge-wrapper">
                        <img src="/assets/images/badge-01.png" alt="badge" className="w-100 h-100" />
                        <span className="fs-18 text-white">{story.rating}</span>
                      </div> */}
                      <img
                        src={story.cover_image_url || (story.cover_image ? `/storage/${story.cover_image}` : '/assets/images/default-cover.jpg')}
                        className="mb-20 w-100 story-book-img"
                        alt={story.title}
                        onError={(e) => {
                          e.target.src = '/assets/images/default-cover.jpg';
                        }}
                      />
                    </div>
                    <div className="d-flex align-items-center justify-content-between mb-10">
                      <h4 className="light-black fs-36 fw-600">{story.title}</h4>
                      <div className='d-flex align-items-center gap-10'>
                        <span className='fs-18 text-primary-theme'>
                          <i className="fas fa-comment me-2 text-primary-theme"></i>
                        </span>
                        <span className="">{story.comment_count}</span>
                      </div>
                    </div>
                    <div className="d-flex justify-content-between align-items-center mb-20">
                      <div className='d-flex align-items-center gap-10'>
                        <i className="fas fa-eye text-primary-theme"></i>
                        <h6 className="text-black fs-18 mb-0">{story.read_count} {story.read_count > 1 ? 'Reads' : 'Read'}</h6>
                      </div>
                      <LikeCount className='gap-10' storyId={story.id} />
                    </div>
                    <div className="d-flex justify-content-between align-items-center mb-20">
                      <div className="d-flex gap-10 align-items-center">
                        <span className="label bg-secondry-theme text-white fs-16 py-10 px-20 radius-60 d-inline-block">
                          {story.genre}
                        </span>
                        {story.rating && story.rating.name && (
                          <span className="label bg-primary-theme text-white fs-16 py-10 px-20 radius-60 d-inline-block">
                            {story.rating.name.charAt(0)}
                          </span>
                        )}
                      </div>
                    </div>
                    <Link href={route('stories.show', story.id)} className="btn btn-primary">Story Details</Link>
                  </div>
                </div>
              ))
            ) : (
              <div className="col-12 text-center">
                <h3 className="secondry-font fs-24 mb-4">No stories found</h3>
                <p className="fs-18">Try adjusting your search or filter to find what you're looking for.</p>
              </div>
            )}
          </div>

          {/* Pagination */}
          {stories.data.length > 0 && (
            <div className="row mt-50">
              <div className="col-12">
                <nav aria-label="Page navigation">
                  <ul className="pagination justify-content-center">
                    {stories.links.map((link, index) => {
                      let label = link.label;
                      if (label === '&laquo; Previous') {
                        label = '<i class="fas fa-chevron-left"></i>';
                      } else if (label === 'Next &raquo;') {
                        label = '<i class="fas fa-chevron-right"></i>';
                      }

                      return (
                        <li key={index} className={`page-item ${link.active ? 'active' : ''} ${link.url ? '' : 'disabled'}`}>
                          <Link
                            className="page-link secondry-font"
                            href={link.url || '#'}
                            dangerouslySetInnerHTML={{ __html: label }}
                          />
                        </li>
                      );
                    })}
                  </ul>
                </nav>
              </div>
            </div>
          )}
        </div>
      </section>
    </Layout>
  );
}
