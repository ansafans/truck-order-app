import { Link } from "@inertiajs/react";
import { useState } from "react";
import ReactPaginate from "react-paginate";

export default function ListUsers({ users }) {
    const items = users;
    const itemsPerPage = 10;
    const [itemOffset, setItemOffset] = useState(0);

    const endOffset = itemOffset + itemsPerPage;
    const currentItems = items.slice(itemOffset, endOffset);
    const pageCount = Math.ceil(items.length / itemsPerPage);

    const handlePageClick = (event) => {
        const newOffset = (event.selected * itemsPerPage) % items.length;
        setItemOffset(newOffset);
    };

    return (
        <>
            <table className='w-full text-left table-auto min-w-max'>
                <thead>
                    <tr>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>ID</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Name</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Email</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Contact</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Address</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Registered</th>
                        <th className='p-4 border-b border-blue-gray-100 bg-blue-gray-50'>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        currentItems.map((user, index) => (
                            <tr key={index}>
                                <td className='p-4 border-b border-blue-gray-50'>{user.id}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{user.name}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{user.email}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{user.contact}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{user.address}</td>
                                <td className='p-4 border-b border-blue-gray-50'>{new Date(user.created_at).toLocaleDateString()}</td>
                                <td className='p-4 border-b border-blue-gray-50'>
                                    <Link href={route('users.edit', { user })} className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded'>
                                        <span>Edit</span>
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