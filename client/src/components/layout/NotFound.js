import React from "react";
import { Link } from "react-router-dom";

const NotFound = () => {
  return (
    <div className="container">
      <h1 className="x-large text-primary">
        <i className="fas fa-exclamation-triangle"></i> 404 - Page Not Found
      </h1>
      <p className="large">The page you are looking for does not exist.</p>
      <Link to="/">Go Back Home</Link>
    </div>
  );
};

export default NotFound;
