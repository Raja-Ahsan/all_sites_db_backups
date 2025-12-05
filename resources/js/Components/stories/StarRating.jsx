import { useState, useEffect } from 'react';
import { usePage } from '@inertiajs/react';
import axios from 'axios';

const StarRating = ({ storyId, initialRating = null, averageRating = null }) => {
  const { auth } = usePage().props;
  const [userRating, setUserRating] = useState(initialRating);
  const [hoveredRating, setHoveredRating] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  const [average, setAverage] = useState(averageRating);

  // Fetch rating on mount
  useEffect(() => {
    const fetchRating = async () => {
      try {
        const response = await axios.get(route('ratings.get', storyId));
        setUserRating(response.data.user_rating);
        setAverage(response.data.average_rating);
      } catch (error) {
        console.error('Error fetching rating:', error);
      }
    };

    fetchRating();
  }, [storyId]);

  const handleStarClick = async (rating) => {
    if (!auth.user) {
      window.location.href = route('login');
      return;
    }

    setIsLoading(true);

    try {
      const response = await axios.post(route('ratings.store', storyId), {
        rating: rating,
      });
      setUserRating(response.data.user_rating);
      setAverage(response.data.average_rating);
    } catch (error) {
      console.error('Error submitting rating:', error);
      if (error.response?.status === 401) {
        window.location.href = route('login');
      }
    } finally {
      setIsLoading(false);
    }
  };

  const renderStar = (index) => {
    const rating = index + 1;
    const isActive = hoveredRating >= rating || (!hoveredRating && userRating >= rating);
    
    return (
      <i
        key={index}
        className={`${isActive ? 'fas' : 'far'} fa-star`}
        style={{
          color: isActive ? '#ffc107' : '#ccc',
          cursor: auth.user ? 'pointer' : 'default',
          fontSize: '24px',
          marginRight: '5px',
        }}
        onMouseEnter={() => auth.user && setHoveredRating(rating)}
        onMouseLeave={() => setHoveredRating(0)}
        onClick={() => auth.user && !isLoading && handleStarClick(rating)}
      />
    );
  };

  return (
    <div className="rating-section mt-4">
      <h5 className="mb-3">Rate this Story</h5>
      <div className="d-flex align-items-center mb-3">
        <div className="star-rating d-flex align-items-center">
          {[0, 1, 2, 3, 4].map((index) => renderStar(index))}
        </div>
      </div>
      {!auth.user && (
        <p className="text-muted fs-14">
          <a href={route('login')}>Login</a> to rate this story
        </p>
      )}
      {!auth.user && (
        <p className="text-muted fs-14">
          <a href={route('login')}>Login</a> to rate this story
        </p>
      )}
      {isLoading && (
        <div className="mt-2">
          <i className="fas fa-spinner fa-spin"></i> Submitting...
        </div>
      )}
    </div>
  );
};

export default StarRating;

