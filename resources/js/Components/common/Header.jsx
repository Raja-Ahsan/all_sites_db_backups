import { useState } from 'react';
import { Link, usePage } from '@inertiajs/react';
// import '@/assets/styles/story-modal.css';
import UserAvatar from './UserAvatar';
import { Icons } from '../../utils/icons';
import LoginPromptModal from '@/Components/stories/LoginPromptModal';

const Header = ({ logoClass, headerClass }) => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const { url } = usePage();
  const { auth, categories } = usePage().props;
  const [showLoginPrompt, setShowLoginPrompt] = useState(false);


  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  // Check if the current URL matches the link
  const isActive = (path) => {
    return url.startsWith(path);
  };

  const handleCloseLoginPrompt = () => {
    setShowLoginPrompt(false);
  };
  return (
    <header className={`position-absolute top-0 w-100 z-3 ${headerClass}`}>
      <div className="container px-2 px-md-3 px-lg-4">
        <div className="d-flex align-items-center justify-content-between flex-wrap">
          <div className="flex-shrink-0">
            <div className="logo">
              <Link href="/"><img src="/assets/images/logo.png" alt="logo" className="img-fluid" style={{ maxWidth: '200px', width: '100%', height: 'auto' }} /></Link>
            </div>
          </div>
          <div className="d-none d-lg-block flex-shrink-1" style={{ minWidth: 0, flex: '1 1 auto' }}>
            <nav>
              <ul className={`d-flex primary-navs align-items-center justify-content-center ${isMenuOpen ? 'active' : ''}`} style={{ gap: 'clamp(10px, 2vw, 40px)' }}>
                <li><Link href="/">Home</Link></li>
                <li><Link href="/about">About</Link></li>
                <li className="dropdown">
                  <Link
                    href="/stories"
                    className="dropdown-toggle"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                    id="storiesDropdown"
                  >
                    Stories
                  </Link>
                  <ul className="dropdown-menu user-dropdown stories-dropdown" aria-labelledby="storiesDropdown">
                    {categories && categories.length > 0 ? (
                      <div className="stories-dropdown-columns">
                        {categories.map((category) => (
                          <li key={category.id}>
                            <Link href={`/stories?category=${category.slug}`} className="user-dropdown-item">
                              {category.name}
                            </Link>
                          </li>
                        ))}
                      </div>
                    ) : (
                      <li><span className="user-dropdown-item text-muted">No categories available</span></li>
                    )}
                  </ul>
                </li>
                <li><Link href="/from-the-vault">From the Vault</Link></li>
                <li><Link href="/packages">Packages</Link></li>
                <li><Link href="/community">Community</Link></li>
                <li><Link href="/how-it-works">How It Works</Link></li>
                <li><Link href="/publish">Publish</Link></li>
              </ul>
            </nav>
          </div>
          <div
            className={`d-flex align-items-center justify-content-end flex-shrink-0`}
            style={{ gap: 'clamp(10px, 1.5vw, 20px)' }}
          >
            <div className="d-none d-md-block">
              {!auth?.user ? (
                <>
                  <div className="dropdown">
                    <button
                      className="btn btn-primary dropdown-toggle"
                      style={{ fontSize: 'clamp(12px, 1.2vw, 18px)', whiteSpace: 'nowrap' }}
                      type="button"
                      id="authDropdown"
                      data-bs-toggle="dropdown"
                      aria-expanded="false"
                    >
                      Account
                    </button>
                    <ul className="dropdown-menu user-dropdown dropdown-menu-end" aria-labelledby="authDropdown">
                      <li><Link href="/login" className="user-dropdown-item">Sign in</Link></li>
                      <li><Link href="/register" className="user-dropdown-item">Sign Up</Link></li>
                      <li><Link href="/guest-login" className="user-dropdown-item">Guest Login</Link></li>
                    </ul>
                  </div>
                </>
              ) : (
                <>
                  <UserAvatar user={auth.user} className="" />
                </>
              )}
            </div>
            <div className="d-lg-none">
              <button
                className="btn btn-link text-white p-0"
                onClick={toggleMenu}
                aria-label="Toggle mobile menu"
              >
                <Icons.Menu size={24} />
              </button>
            </div>
          </div>
        </div>
      </div>
      <nav className="d-lg-none">
        <ul className={`d-flex primary-navs align-items-center justify-content-center ${isMenuOpen ? 'active' : ''}`}>
          <div className="close-menu d-flex d-lg-none" onClick={toggleMenu}><Icons.Cross /></div>
          <li><Link href="/" onClick={() => setIsMenuOpen(false)}>Home</Link></li>
          <li><Link href="/about" onClick={() => setIsMenuOpen(false)}>About</Link></li>
          <li className="dropdown">
            <Link
              href="/stories"
              className="dropdown-toggle"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              id="storiesDropdownMobile"
              onClick={(e) => e.preventDefault()}
            >
              Stories
            </Link>
            <ul className="dropdown-menu user-dropdown stories-dropdown" aria-labelledby="storiesDropdownMobile">
              {categories && categories.length > 0 ? (
                <div className="stories-dropdown-columns">
                  {categories.map((category) => (
                    <li key={category.id}>
                      <Link href={`/stories?category=${category.slug}`} className="user-dropdown-item" onClick={() => setIsMenuOpen(false)}>
                        {category.name}
                      </Link>
                    </li>
                  ))}
                </div>
              ) : (
                <li><span className="user-dropdown-item text-muted">No categories available</span></li>
              )}
            </ul>
          </li>
          <li><Link href="/from-the-vault" onClick={() => setIsMenuOpen(false)}>From the Vault</Link></li>
          <li><Link href="/packages" onClick={() => setIsMenuOpen(false)}>Packages</Link></li>
          <li><Link href="/community" onClick={() => setIsMenuOpen(false)}>Community</Link></li>
          <li><Link href="/how-it-works" onClick={() => setIsMenuOpen(false)}>How It Works</Link></li>
          <li><Link href="/publish" onClick={() => setIsMenuOpen(false)}>Publish</Link></li>
        </ul>
      </nav>
    </header>

  )
};

export default Header;