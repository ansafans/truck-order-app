import { Link } from "@inertiajs/react";
import { Card, Chip, Typography } from "@material-tailwind/react";
import { useState } from "react";
import ReactPaginate from "react-paginate";
import './List.css';

export default function ListOrders({ auth, orders }) {

    const items = orders;
    const itemsPerPage = 10;
    const [itemOffset, setItemOffset] = useState(0);

    const endOffset = itemOffset + itemsPerPage;
    const currentItems = items.slice(itemOffset, endOffset);
    const pageCount = Math.ceil(items.length / itemsPerPage);

    const handlePageClick = (event) => {
        const newOffset = (event.selected * itemsPerPage) % items.length;
        setItemOffset(newOffset);
    };

    function showOrderStatus(status) {
        if (status === "pending") return <Chip color="blue" value="PENDING" />
        else if (status === "in_progress") return <Chip color="amber" value="IN PROGRESS" />
        else if (status === "delivered") return <Chip color="green" value="DELIVERED" />
        else return null;
    }

    return (
        <>
            <table className='w-full text-left table-auto min-w-max'>
                <thead>
                    <tr>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>ID</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Name</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Contact</th>
                        {/* <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Size</th> */}
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Weight</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Status</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Created</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        currentItems.map((order, index) => (
                            <tr key={index}>
                                <td className='p-4 border-b border-blue-gray-50'>{order.id}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{order.name}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{order.contact}</td>
                                {/* <td className='p-4 border-b border-blue-gray-50'>{order.size}</td> */}
                                <td className='p-4 border-b border-blue-gray-50'>{order.weight}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{showOrderStatus(order.status)}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{new Date(order.created_at).toLocaleDateString() + ' ' + new Date(order.created_at).toLocaleTimeString()}</td>
                                <td className='p-4 border-b border-blue-gray-50'>
                                    <Link href={route('orders.edit', { order })} className='bg-blue-500 mr-2 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded'>
                                        <span>Edit</span>
                                    </Link>
                                    <Link href={route('orders.show', { order, readonly: true })} className='bg-black hover:bg-cyan-700 text-white font-bold py-2 px-4 rounded'>
                                        <span>View</span>
                                    </Link>
                                </td>
                            </tr>
                        ))
                    }
                </tbody>
            </table>
            <div style={{textAlign: 'center', marginTop: 15, height: 50}}>
                <ReactPaginate
                    breakLabel="..."
                    nextLabel="next >"
                    onPageChange={handlePageClick}
                    pageRangeDisplayed={5}
                    pageCount={pageCount}
                    previousLabel="< previous"
                    renderOnZeroPageCount={null} 
                    containerClassName="inline-flex -space-x-px text-sm"
                    pageLinkClassName="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
                    previousLinkClassName="flex items-center justify-center px-3 h-8 ms-0 leading-tight text-gray-500 bg-white border border-e-0 border-gray-300 rounded-s-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
                    nextLinkClassName="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 rounded-e-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
                    activeLinkClassName="flex items-center justify-center px-3 h-8 text-blue-600 border border-gray-300 bg-blue-50 hover:bg-blue-100 hover:text-blue-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white100"/>
            </div>
        </>
    );
}

