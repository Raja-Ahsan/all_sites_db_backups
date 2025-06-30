import React, { useState } from 'react';

const AccordionItem = ({ title, content, isOpen, onClick }) => (
  <div
    className="accordion-item border border-[#565656] rounded-[17px] py-[18px] px-[18px] md:px-[43px] mb-4 transition-all ease-in-out duration-300"
    onClick={onClick}
  >
    <div className="flex justify-between items-center cursor-pointer">
      <h3 className="text-[20px] md:text-[25px] text-white font-semibold mb-[10px]">{title}</h3>
      <i
        className={`text-white text-[20px] md:text-[25px] ${isOpen ? 'fas fa-minus' : 'fas fa-plus'}`} // Toggle plus/minus icon
      />
    </div>
    <div
      className={`overflow-hidden transition-all ease-in-out duration-300 ${
        isOpen ? 'max-h-[1000px] opacity-100' : 'max-h-0 opacity-0'
      }`} // Apply transition for smooth open/close
    >
      {isOpen && (
        <div className="text-[#676767] text-[18px] mt-[10px]">
          <p>{content}</p>
        </div>
      )}
    </div>
  </div>
);

const Accordion = () => {
  const [openIndex, setOpenIndex] = useState(null); // Track the currently open item

  const handleToggle = (index) => {
    setOpenIndex(openIndex === index ? null : index); // Close the current or open the new one
  };

  return (
    <div className="w-full mx-auto mt-6">
      <AccordionItem
        title="How much do your services cost?"
        content="Our pricing varies based on the project scope, complexity, and timeline. Once we understand your goals, we’ll provide a custom quote that fits your budget. Contact us for a free consultation."
        isOpen={openIndex === 0}
        onClick={() => handleToggle(0)}
      />
      <AccordionItem
        title=" How long does it take to build a website or app?"
        content="Our pricing varies based on the project scope, complexity, and timeline. Once we understand your goals, we’ll provide a custom quote that fits your budget. Contact us for a free consultation."
        isOpen={openIndex === 1}
        onClick={() => handleToggle(1)}
      />
      <AccordionItem
        title="Do you offer custom designs or use templates?"
        content="Our pricing varies based on the project scope, complexity, and timeline. Once we understand your goals, we’ll provide a custom quote that fits your budget. Contact us for a free consultation."
        isOpen={openIndex === 2}
        onClick={() => handleToggle(2)}
      />
      <AccordionItem
        title="Can you redesign my existing website or brand?"
        content="Our pricing varies based on the project scope, complexity, and timeline. Once we understand your goals, we’ll provide a custom quote that fits your budget. Contact us for a free consultation."
        isOpen={openIndex === 3}
        onClick={() => handleToggle(3)}
      />
      <AccordionItem
        title="Will my website be mobile-friendly?"
        content="Our pricing varies based on the project scope, complexity, and timeline. Once we understand your goals, we’ll provide a custom quote that fits your budget. Contact us for a free consultation."
        isOpen={openIndex === 4}
        onClick={() => handleToggle(4)}
      />
    </div>
  );
};

export default Accordion;
